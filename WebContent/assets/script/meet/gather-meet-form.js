window.gather = new class GatherMeetForm {
  constructor(){
    this._keys = {
      employee: "",
      task: "",
      topic: ""
    }
  }
  
  employee(){
    this.setKey("employee");

    const EmployeeWrapper = {
      tagName: "section",
      props: {
        className: "employee accordion mb-1",
        id: this.getKey("employee"),
        children: []
      }
    }
    const cardWrapper = {
      tagName: "div",
      props: {
        className: "card",
        children: []
      }
    }
    const cardHeader = {
      tagName: "div",
      props: {
        className: "card-header",
        children: [
          {
            tagName: "div",
            props: {
              className: "input-group",
              children: [
                {
                  tagName: "label",
                  props: {
                    className: "sr-only",
                    for: `employee-name-${this.getKey("employee")}`,
                    children: ["Funcionário"]
                  }
                },
				{
					tagName: "span",
					props: {
						className: "form-control-plaintext text-left border collapse",
						"data-child": this.getKey("employee"),
						"data-hidden": "true",
						children: []
					}
				},
                {
                  tagName: "input",
                  props: {
                    className: "form-control collapse show",
                    type: "text",
                    placeholder: "Nome do funcionário",
                    list: "relacao-funcionarios",
                    id: `employee-name-${this.getKey("employee")}`,
                    name: "txtEmployeeName",
                    required: "required",
                    "data-id": this.getKey("employee"),
                    "data-active": "true",
                    children: []
                  }
                },
                {
                  tagName: "div",
                  props: {
                    className: "input-group-append",
                    children: [
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-outline-secondary bi bi-pencil-square",
                          "data-action": `edit`,
                          "data-target": `#employee-name-${this.getKey("employee")}`,
                          children: ["&#128221;"]
                        }
                      },
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-outline-danger",
                          "data-action": `remove`,
                          "data-target": `#${this.getKey("employee")}`,
                          children: ["&times;"]
                        }
                      },
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-link collapsed",
                          "data-toggle": "collapse",
                          "data-target": `#task-${this.getKey("employee")}`,
                          "aria-expanded": "false",
                          "aria-controls": `task-${this.getKey("employee")}`,
                          children: ["Tarefas"]
                        }
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
    const cardContentWrapper = {
      tagName: "div",
      props: {
        className: "task-list-area collapse",
        id: `task-${this.getKey("employee")}`,
        "data-parent": ".employees",
        children: []
      }
    }
    const cardContentBody = {
      tagName: "div",
      props: {
        className: "card-body",
        children: [
          {
            tagName: "span",
            props: {
              className: "input-group-text text-center d-block w-100 rounded mb-1",
              children: ["Tarefas"]
            }
          },
          {
            tagName: "div",
            props: {
              className: "tasks",
              children: []
            }
          }
        ]
      }
    }
    const cardContentFooter = {
      tagName: "div",
      props: {
        className: "card-footer",
        children: [
          {
            tagName: "button",
            props: {
              type: "button",
              className: "btn btn-outline-secondary",
              "data-action": "task",
              "data-parent": `#${this.getKey("employee")}`,
              "data-target": `.tasks`,
              children: ["Nova Tarefa"]
            }
          }
        ]
      }
    }

    this._appendChildNode(cardContentWrapper, cardContentBody, cardContentFooter);
    this._appendChildNode(cardWrapper, cardHeader, cardContentWrapper);
    this._appendChildNode(EmployeeWrapper, cardWrapper);

    const employeeEl = this._convertToHTML(EmployeeWrapper);
    const taskEl = this.task(`#${this.getKey("employee")}`);

    $(employeeEl).find(".tasks").append(taskEl);

    return employeeEl;
  }
  
  task(parent){
    this.setKey("task");

    const Wrapper = {
      tagName: "section",
      props: {
        className: "task accordion mb-1",
        id: this.getKey("task"),
        children: []
      }
    }
    const CardWrapper = {
      tagName: "div",
      props: {
        className: "card",
        children: []
      }
    }
    const CardHeader = {
      tagName: "div",
      props: {
        className: "card-header text-right",
        children: [
          {
            tagName: "div",
            props: {
              className: "input-group",
              children: [
                {
                  tagName: "label",
                  props: {
                    for: `task-name-${this.getKey("task")}`,
                    class: "sr-only",
                    children: ["Título da Tarefa"]
                  }
                },
                {
                  tagName: "input",
                  props: {
                    type: "text",
                    className: "form-control",
                    placeholder: "Título da Tarefa",
                    id: `task-name-${this.getKey("task")}`,
                    name: "txtTaskName",
                    required: "required",
                    children: []
                  }
                },
                {
                  tagName: "div",
                  props: {
                    className: "input-group-append",
                    children: [
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-outline-danger",
                          "data-action":`remove`,
                          "data-target":`#${this.getKey("task")}`,
                          children: ["X"]
                        }
                      },
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-link collapsed",
                          "data-toggle": "collapse",
                          "aria-expanded": "false",
                          "data-target":`#topic-${this.getKey("task")}`,
                          "aria-controls":`topic-${this.getKey("task")}`,
                          children: ["Descrição"]
                        }
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
    const CardBody = {
      tagName: "div",
      props: {
        className: "topic-list-area collapse",
        id: `topic-${this.getKey("task")}`,
        "data-parent": `${parent} .tasks`,
        children: [
          {
            tagName: "div",
            props: {
              className: "card-body",
              children: [
                {
                  tagName: "label",
                  props: {
                    className: "sr-only",
                    for: "taskDescription",
                    children: ["Descrição da Tarefa"]
                  }
                },
                {
                  tagName: "textarea",
                  props: {
                    className: "descricao form-control",
                    id: "taskDescription",
                    name: "txtTaskDescription",
                    children: []
                  }
                }
              ]
            }
          }
        ]
      }
    }

    this._appendChildNode(CardWrapper, CardHeader, CardBody);
    this._appendChildNode(Wrapper, CardWrapper);

    const taskEl = this._convertToHTML(Wrapper);
    // const topicEl = this.topic()

    // $(taskEl).find(".topics").append(topicEl);

    return taskEl;
  }
  
  topic(){
    this.setKey("topic");

    const Wrapper = {
      tagName: "li",
      props: {
        className: "list-group-item",
        id: this.getKey("topic"),
        children: [
          {
            tagName: "div",
            props: {
              className: "input-group",
              children: [
                {
                  tagName: "label",
                  props: {
                    for: `topic-name-${this.getKey("topic")}`,
                    className: "sr-only",
                    children: ["Título do Tópico"]
                  }
                },
                {
                  tagName: "input",
                  props: {
                    type: "text",
                    className: "form-control",
                    name: "txtTopicName",
                    placeholder: "Título do Tópico",
                    id: `topic-name-${this.getKey("topic")}`,
					required: "required",
                    children: []
                  }
                },
                {
                  tagName: "div",
                  props: {
                    className: "input-group-append",
                    children: [
                      {
                        tagName: "button",
                        props: {
                          type: "button",
                          className: "btn btn-outline-danger",
                          title: "Excluir Tópico",
                          "data-action": "remove",
                          "data-target": `#${this.getKey("topic")}`,
                          children: ["X"]
                        }
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }

    return this._convertToHTML(Wrapper);
  }

  _appendChildNode(parentNode, ...childNode){
    childNode.forEach(node => {
      parentNode.props.children.push(node);
    });
  }

  _uuid(){
    const uuid = Math.random().toString(36).slice(2);
    const short = uuid.slice(-6);

    if(short[0].match(/[0-9]/)) {
      return `${uuid.split("").map(char => char.match(/[^0-9]/) ? char : undefined).filter(item => item)[0]}${short}`;
    }

    return short;
  }

  _convertToHTML(elementNode){
    if(typeof elementNode !== "object") {
		var t = document.createElement("div");
		t.innerHTML = elementNode;
		return document.createTextNode(t.innerText || t.textContent);
    }

    const $domElement = document.createElement(elementNode.tagName);
    
    Object.keys(elementNode.props).forEach(prop => {
      if(prop !== "children") {
        $domElement.setAttribute(prop === "className" ? "class" : prop, elementNode.props[prop]);
      }
    });

    elementNode.props.children.forEach(childNode => {
      $domElement.appendChild(this._convertToHTML(childNode));
    });

    return $domElement;
  }

  getKey(name){
    return this._keys[name];
  }
  
  setKey(name){
    this._keys[name] = this._uuid();
  }
}