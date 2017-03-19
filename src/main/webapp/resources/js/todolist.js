var ajaxUrl = 'ajax/profile/projects/';

var projectRow = $("#projectRow_projectId_").prop('outerHTML');

var tableRow = $("#row_taskId_").prop('outerHTML');

function editTask(projectId,taskId) {
    $.ajax({
        dataType: "json",
        url: ajaxUrl+projectId + "/tasks/" + taskId,
        data: null,
        success: function(data) {
            $("#editTaskName").val(data.name);
            $("#editTaskId").val(data.id);
            $("#editTaskCreated").val(data.created);
            $("#editTaskPriority").val(data.priority);
            $("#editTaskProjectId").val(projectId);
            if(data.deadLine!=null)
                $("#editDeadLine").val(data.deadLine.replace("T"," ").substring(0,16));
            else $("#editDeadLine").val("");
            $("#editTaskIsDone").prop("checked",data.done);
        }
    })
}

function editProject(button_id) {
    var projectID = button_id.replace("editProject_","");
    $.ajax({
        dataType: "json",
        url: ajaxUrl+projectID,
        data: null,
        success: function(data) {
            $("#editProjectName").val(data.name);
            $("#editProjectId").val(data.id);
            $("#editProjectCreated").val(data.created);
        }
    })
}

function updateTask() {
    var name = $("#editTaskName").val();
    var id = $("#editTaskId").val();
    var created = $("#editTaskCreated").val();
    var priority = $("#editTaskPriority").val();
    var projectId = $("#editTaskProjectId").val();
    var done = $("#editTaskIsDone").prop("checked");
    var deadline = $("#editDeadLine").val().replace(" ","T");
    console.log(JSON.stringify({
        id:id,
        created: created,
        name:name,
        project_id: projectId,
        priority: priority
    }));

    $.ajax({
        type: "PUT",
        url: ajaxUrl+projectId+"/tasks/"+id,
        contentType: "application/json",
        data: JSON.stringify({
            id:id,
            created: created,
            name:name,
            priority: priority,
            done: done,
            deadLine: deadline
        }),
        success: function() {
            $("#taskName_"+id).empty();
            $("#taskName_"+id).append(name);
            $("#checkBox_"+id+"_"+projectId).prop("checked", done);

            if(deadline==null||deadline.length==0) $("#deadline_"+id).addClass("hidden");
            else {
                $("#deadline_"+id).removeClass("hidden");
                $("#deadline_"+id).empty().append(deadline.replace("T"," ").substring(0,16));
            }

        }
    });
}

function updateProject() {
    var name = $("#editProjectName").val();
    var projectId = $("#editProjectId").val();
    var created = $("#editProjectCreated").val();
    console.log(JSON.stringify({
        name:name,
        id:projectId
    }));

    $.ajax({
        type: "PUT",
        url: ajaxUrl+projectId,
        contentType: "application/json",
        data: JSON.stringify({
            id:projectId,
            created: created,
            name:name}),
        success: function() {
            $("#projectHeaderName_"+projectId).empty();
            $("#projectHeaderName_"+projectId).append(name);
        }
    });
}

function deleteTask(projectId, taskId) {
    $.ajax({
        type: "DELETE",
        dataType: "json",
        url: ajaxUrl+projectId+"/tasks/"+taskId,
        data: null,
    });
    $("#row_"+taskId).remove();
}

function deleteProject(projectId) {
    $.ajax({
        type: "DELETE",
        dataType: "json",
        url: ajaxUrl+projectId,
        data: null,
    });
    $("#projectRow_"+projectId).remove();
}

function taskRender(id, projectId, name, done, deadline, where) {
    var row = tableRow.replace(/taskId_/g,id).replace(/projectId_/g,"_"+projectId);
    where?
        $("#tbody_"+projectId).prepend(row):
        $("#tbody_"+projectId). append(row);
    $("#taskName_"+id).prepend(name);
    $("#checkBox_"+id+"_"+projectId).prop("checked", done);
    $("#checkBox_"+id+"_"+projectId).change(function(){
        setDone(this);
    });
    deadline==null?
        $("#deadline_"+id).addClass("hidden"):
        $("#deadline_"+id).removeClass("hidden");
    if(deadline!=null) $("#deadline_"+id).empty().append(deadline.replace("T"," ").substring(0,16));
    $("#row_"+id).mouseenter(function(){
        $("#controlsDiv_"+id).removeClass("hidden");
        $("#row_"+id).addClass("mouseovertask");
    }).mouseleave(function(){
        $("#controlsDiv_"+id).addClass("hidden");
        $("#row_"+id).removeClass("mouseovertask");
    });

    done?
        $("#taskName_"+id).css("text-decoration","line-through"):
        $("#taskName_"+id).css("text-decoration","none");
}

function addTask(addTaskButtonId) {
    var projectId = addTaskButtonId.replace("addTaskButton_","");
    var name = $("#addTaskInput_"+projectId).val();
    $.ajax({
        type: "POST",
        url: ajaxUrl+projectId+"/tasks/",
        contentType: "application/json",
        data: JSON.stringify({
            name:name}),
        success: function(data) {
            taskRender(data.id,data.project.id,data.name, data.done, null, true);
            $("#addTaskInput_"+projectId).val('');
        }
    });
}

function updateTaskByData(data,projectId,where) {
    $.each(data, function(key, val) {
        taskRender(val.id,projectId,val.name, val.done, val.deadLine, where);
    });
}

function getTasks(projectId) {
    $.ajax({
        dataType: "json",
        url: ajaxUrl+projectId+"/tasks/",
        data: null,
        success: function(data) {
            updateTaskByData(data,projectId,false)
        }
    });
}

function projectRender(id,name,where) {
    var element = projectRow.replace(/projectId_/g,id);
    where?
        $("#ajax_project_load").prepend(element):
        $("#ajax_project_load").append (element);
    $("#projectHeaderName_"+id).append(name);
    $("#project_header_"+id).mouseenter(function(){
        $("#project_header_controls_"+id).removeClass("hidden");
    }).mouseleave(function(){
        $("#project_header_controls_"+id).addClass("hidden");
    });
    var fixHelperModified = function(e, tr) {
        var $originals = tr.children();
        var $helper = tr.clone();
        $helper.children().each(function(index) {
            $(this).width($originals.eq(index).width())
        });
        return $helper;
    };
    $('#tbody_'+id).sortable({
        axis: 'y',
        helper: fixHelperModified,
        handle: "#sortable_row",
        update: function(event, ui) {
            var productOrder = $(this).sortable('toArray').toString().replace(/row_/g,'');
            console.log(productOrder);
        }
    });
}

function addProject() {
    var name = $("#addProjectName").val();
    $.ajax({
        type: "POST",
        url: ajaxUrl,
        contentType: "application/json",
        data: JSON.stringify({
            name:name}),
        success: function(data) {
            projectRender(data.id,data.name,false);
            $("#addProjectName").val('');
        }
    });
}

function updateProjectByData(data) {
    $.each( data, function(key, val) {
        var id = val.id;
        projectRender(id,val.name,true);
        getTasks(id);
    });

}

function getProjects() {
    $("#ajax_project_load").empty();
    $.ajax({
        dataType: "json",
        url: ajaxUrl,
        data: null,
        success: function(data) {updateProjectByData(data)}
    });
}

function setDone(checkBox) {
    projectId = checkBox.id.split('_')[2];
    id = checkBox.id.split('_')[1];
    done = $("#"+checkBox.id).prop("checked");
    $.ajax({
        type: "POST",
        url: ajaxUrl + projectId + "/tasks/" + id + "/status",
        data: {done: done},
        success: function () {
            done?
                $("#taskName_"+id).css("text-decoration","line-through"):
                $("#taskName_"+id).css("text-decoration","none");
        }
    });
}

$('#editDeadLine').datetimepicker({
    format:'Y-m-d H:i'
});

/* OnPageLoad */
$(function () {
    getProjects();

    $('#ajax_project_load').sortable({
        axis: 'y',
        handle:"#sortable_project",
        update: function(event, ui) {
            var productOrder = $(this).sortable('toArray').toString().replace(/projectRow_/g,'');
            console.log(productOrder);
        }
    });
});



