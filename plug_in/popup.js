function addItem(item_url, item_title, user_id, image_url, project_id, tags) {
  console.log(project_id);
  console.log(item_url);

  fetch("http://localhost:3000/create_ext", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    credentials: 'same-origin',
    // this line is to allow to push on my rails app through the plug_in
    body: JSON.stringify({
      item_url: item_url,
      item_title: item_title,
      user_id: user_id,
      image_url: image_url,
      project_id: project_id,
      tags: tags
    })
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    console.log(data.price)
    if(data.status == "ok") {
      document.getElementById("save-btn").innerText = "Done";
    }

    // set the answer depending on create ext.
    // display
  });
};

// Step 2 - get collected images from collect_images.js output + launch user info


let images; let image_url
chrome.extension.onRequest.addListener(function(request, sender){
  console.log(request.type)
  if(request.type === 'collect_images'){
    images = request.images;
    image_url = images[0].src;
    console.log(image_url);
    getUserInfo();
  }
});

function displayImages(images){
  if(images.length === 0 ) {
    'nothing to display'
  } else {
    document.getElementById('selected-image').src = image_url;
    document.getElementById('item-title').value= item_title
  }
}
// Step 3 - get user info + launch showSections


let user_logged_in, user_id, projects, project, project_id;
function getUserInfo() {
  fetch("http://localhost:3000/json_to_send", { credentials: 'include' })
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    user_logged_in = data.logged_in;
    user_id = data.user_id;
    projects = data.projects;
    projects.forEach((project) => {
      html = `<option value="${project["id"]}"> ${project["name"]}</option>`;
      document.getElementById("user-projects").insertAdjacentHTML("beforeend", html);
    });
  });
  displayImages(images)
};

// Step 1 - get tab info + launch image collection
let item_url, item_title;
chrome.tabs.getSelected(null, function(tab){
  item_url   = tab.url;
  item_title = tab.title;
  chrome.tabs.executeScript(tab.id, {file:'collect_images.js'});
});
// document.addEventListener("DOMContentLoaded", () => {

//   // set new project
//   document.getElementById("user-list").addEventListener('change', () => {
//     if (document.getElementById("user-list").value == -1) {
//       document.getElementById("new-list-title").style.display = "block";
//     }
//     else {
//       document.getElementById("new-list-title").style.display = "none";
//     }
//   })
// });

// launch the create function
let tags = [];
document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM fully loaded and parsed");
  // Add here your addEventListener code
  document.getElementById("user-projects").addEventListener('change', () => {
  });

  document.getElementById("tag-title").addEventListener('keydown', () => {
    console.log(event.key)
    if(event.key === "Enter") {
      let word = document.getElementById("tag-title").value;
      tags.push(word)
      let list = document.getElementById("display_tag");
      list.insertAdjacentHTML( "beforeend", `<li> ${word} </li>`);
      document.getElementById("tag-title").value = ""
      console.log(tags)
    }


  });

  document.getElementById('item-title').placeholder= item_title
  const create = document.getElementById("save-btn");
  create.addEventListener("click", (event) => {
    console.log(event);
    project_id = document.getElementById("user-projects").value;
    console.log(item_url, item_title,user_id, image_url,project_id);
    addItem(item_url, item_title,user_id, image_url,project_id, tags);
  });
});

