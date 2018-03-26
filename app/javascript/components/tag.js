function filterByTag() {
  const tags = document.querySelectorAll(".card-tag-index");
  const search = document.querySelector("#search-tag");
  const select = search.querySelector("select");
  tags.forEach(tag => {
    tag.addEventListener("click", function() {
      select.value = tag.innerText;
      search.submit();
    })
  });
}
export {filterByTag}
