$(document).ready(() => {
  attachProblemListeners();
})

function attachProblemListeners(){
  indexListener();
  nextProblemListener();
  showCommentsListener();
  commentPostListener();
}


function indexListener(){
  $(".js-more").on("click", function(){
    let problem_id = $(this).data("id");
    let user_id = $(this).data("uid");
    $.getJSON("/users/" + user_id + "/problems/" + problem_id + ".json", data => {
      $("#problem-display").html(
        `<h3>${data.name}</h3>
        <p>${data.description}</p>`
      )
    })
  })
}

function nextProblemListener(){
  let allProblems = []
  let currentId = parseInt($(".js-next").attr("data-uid"))

  //get all problem Id's for the current user
  $.get("/users/" + currentId + ".json").done(resp => {
    resp["problems"].forEach(function(problem){
      allProblems.push(problem.id)
    })
  })

  $(".js-next").on('click', () => {
    let problemId = parseInt($(".js-next").attr("data-id"))
    let currentIndex = allProblems.indexOf(problemId)
    let nextIndex = currentIndex + 1
    let next = problemId

    if(allProblems.length === 1){
      alert("You only have one math problem silly")
    }else if(nextIndex === allProblems.length){
      next = allProblems[0]
    }else{
      next = allProblems[nextIndex]
    }

    let nextURL = `/users/${currentId}/problems/${next}.json`

     $.get(nextURL).done(resp => {
       $('.title').html(`<h1><center>${resp.name}</center></h1>`)
       $('.details').html(`
       <h4>Problem location: ${resp.city}, ${resp.school}</h4>
       <h3>Description:</h3>
       <p>${resp.description}</p>`)
       $('.button_to').attr('action', `/help_problem/${resp.id}`)
       $('#edit-problem').attr('href', `/users/${currentId}/problems/${resp.id}/edit`)
       $('#delete-problem').attr('href', `/users/${currentId}/problems/${resp.id}`)
       $('.categories').html(`${categoryDisplay(resp.categories)}`)
       $('#new_problem_comment').attr('action', `/users/${currentId}/problems/${resp.id}/comments`)
       $('#hidden-problemId').attr('value', `${resp.id}`)
       $('.comment-list').empty();
       $('.js-next').attr('data-id', resp.id)
    })
  })
}

function categoryDisplay(categoryArray){
  let response = ""
  for(let category of categoryArray){
    response += `<li><a href="/categories/${category.id}">${category.name}</a></li>`
  }
  return response
}

function showCommentsListener(){
  $('.show-comments').on('click', function(e){
    e.preventDefault();
    let problemId = parseInt($(".js-next").attr("data-id"))
    let userId = parseInt($(".js-next").attr("data-uid"))
    $.getJSON(`/users/${userId}/problems/${problemId}/comments`, function(resp){
      $('.comment-list').append(`${listComments(resp)}`)
    })
  })
}

function listComments(commentArray){
  let comments = ""
  for(let comment of commentArray){
    comments += `<li class="comment"> ${comment.user.username} says: ${comment.comment}</li>`
  }
  return comments
}

function commentPostListener(){
  $('.new_problem_comment').on('submit', function(event){
    event.preventDefault();
    $.post(this.action, $(this).serialize()).done(function(resp){
      let newComment = new Comment(resp)
      $('#problem_comment_comment').val("")
      commentFormat = newComment.showComment();
      $('.comment-list').append(commentFormat);
      $('#comment-button').prop('disabled', false);
    })
  })
}

function Comment(commentJson){
  this.id = commentJson.id
  this.user_id = commentJson.user_id
  this.problem_id = commentJson.problem_id
  this.comment = commentJson.comment
  this.username = commentJson.user.username
}

Comment.prototype.showComment = function(){
  return `<li>${this.username} says - ${this.comment}`
}
