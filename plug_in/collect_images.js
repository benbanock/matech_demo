function getImages(doc) {
  if(!doc || !doc.images || !doc.images.length) return [];
  var arr=[], sources=[], img, w, h;
  for(var i=0, l=doc.images.length; i < l; i++) {

    img = doc.images[i];
    w   = img.offsetWidth;
    h   = img.offsetHeight;

    if(w > 140 && h > 140 && sources.indexOf(img.src) < 0) {
      sources.push(img.src);
      arr.push({'src':img.src, 'w':w, 'h':h});
    }
  }
  return arr;
}

var images = getImages(document);
chrome.extension.sendRequest({type:'collect_images', images:images});
