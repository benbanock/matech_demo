function filterByTag() {
  const tags = document.querySelectorAll(".card-tag-index");
  const search = document.querySelector("#search-tag");
  tags.forEach(tag => {
    tag.addEventListener("click", function() {
      if (search) {
        const select = search.querySelector("select");
        select.value = tag.innerText;
        search.submit();
      } else {
        window.location = `/items?utf8=✓&query%5B%5D=${tag.innerText}`;
      }
    })
  });
}
export {filterByTag}
