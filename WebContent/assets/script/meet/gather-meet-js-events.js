$(document).ready(
	window.timeoutIds = {},
	
	$(".employees").append(gather.employee()),
	
	$(document).on("input", ".employees input[name='txtEmployeeName']", function() {
		const id = $(this).data("id");
		clearTimeout(timeoutIds[id]);
		
		if(!timeoutIds.hasOwnProperty(id)) {
			timeoutIds[id] = 0;
		}
		
		timeoutIds[id] = setTimeout(function() {
			const el = document.querySelector(`[data-id='${id}']`),
			      child = document.querySelector(`[data-child='${id}']`),
			      option = $(el.list).find(`option[value='${$(el).val()}']`).attr("label");
			
			$(el).data("active", "false").attr("readonly", true).toggleClass("show");
			$(child).data("hidden", "false").toggleClass("show").text(option);
		}, 1350);
	}),
	
	$(document).on("click", "button[data-action='edit']", function(){
		const el = $($(this).data("target")),
		      child = document.querySelector(`[data-child='${el.data("id")}']`); 
		
		$(el).attr("readonly", false).toggleClass("show");
		$(child).data("hidden", "true").toggleClass("show");
	}),
	
    $(document).on("click", "button", function () {
      const action = $(this).data("action");

      if (action) {
        switch (action) {
          case "employee":
            $($(this).data("target")).append(gather.employee());
            break;
          case "task":
            const taskParent = $(this).data("parent"),
              taskTarget = $(this).data("target");

            $(taskParent).find(taskTarget).append(gather.task(taskParent));
            break;
          case "topic":
            const topicParent = $(this).data("parent"),
              topicTarget = $(this).data("target");

            $(topicParent).find(topicTarget).append(gather.topic());
            break;
          case "remove":
            $($(this).data("target")).remove();
          default:
            break;
        }
      }
  	})
);