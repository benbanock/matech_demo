function addItem(item_url, item_title, user_id, images_url) {
  // project_id = document.getElementById("user-project").value;
  // console.log(item_url)
  // console.log(item_title)
  // console.log(image_url)
  // console.log(user_id)
  fetch("http://mattech.tech/create_ext", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    credentials: 'same-origin',
    body: JSON.stringify({
      item_url: item_url,
      item_title: item_title,
      user_id: user_id,
      images_url: images_url
      // project_id: project_id,
    })
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
};


// Step 2 - get collected images from collect_images.js output + launch user info


let images; let images_url
chrome.extension.onRequest.addListener(function(request, sender){
  console.log(request.type)
  if(request.type === 'collect_images'){
    images = request.images;
    // console.log(images);
    // showSections(request.images);
    images_url = images[0].src
    console.log(images_url)
    getUserInfo();
  }
});

// let image_url == images[]


// Step 3 - get user info + launch showSections


let user_logged_in, user_id, projects, project_id;
function getUserInfo() {
  fetch("http://mattech.tech/json_to_send", { credentials: 'include' })
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    user_logged_in = data.logged_in;
    user_id = data.user_id;
    projects = data.projects;
    // pref_project_id = data.pref_project_id;
    // pref_pricedrops = data.pref_pricedrops;
    // console.log(own_lists);
    // showSections(images);
  });
};

// Step 1 - get tab info + launch image collection
let item_url, item_title;
chrome.tabs.getSelected(null, function(tab){
  item_url   = tab.url;
  item_title = tab.title;
  chrome.tabs.executeScript(tab.id, {file:'collect_images.js'});
});
document.addEventListener("DOMContentLoaded", () => {
  // function setTabsNav()
  document.getElementById("save_tab").addEventListener('click', () => {
    document.getElementById("save_tab").classList.add("active");
    document.getElementById("send_tab").classList.remove("active");
    document.getElementById("help_tab").classList.remove("active");
    $("#wrap_add").show();
    $("#save").show();
    $("#send").hide();
    $("#help").hide();
    if (user_logged_in) {
      $("#save-btn").show();
    }
  })
  document.getElementById("send_tab").addEventListener('click', () => {
    document.getElementById("save_tab").classList.remove("active");
    document.getElementById("send_tab").classList.add("active");
    document.getElementById("help_tab").classList.remove("active");
    $("#wrap_add").show();
    $("#save").hide();
    $("#send").show();
    $("#help").hide();
    $("#save-btn").hide();
  })
  document.getElementById("help_tab").addEventListener('click', () => {
    document.getElementById("save_tab").classList.remove("active");
    document.getElementById("send_tab").classList.remove("active");
    document.getElementById("help_tab").classList.add("active");
    $("#wrap_add").hide();
    $("#wrap_fail").hide();
    $("#save").hide();
    $("#send").hide();
    $("#help").show();
    $("#save-btn").hide();
  })
  // set new project
  document.getElementById("user-list").addEventListener('change', () => {
    if (document.getElementById("user-list").value == -1) {
      document.getElementById("new-list-title").style.display = "block";
    }
    else {
      document.getElementById("new-list-title").style.display = "none";
    }
  })
});

// launch the create function
let image_url
document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM fully loaded and parsed");
  // Add here your addEventListener code
  const create = document.getElementById("save-btn");
  create.addEventListener("click", (event) => {
    console.log(event);
    addItem(item_url, item_title, image_url, user_id);
  });
});

// send back data to matech



