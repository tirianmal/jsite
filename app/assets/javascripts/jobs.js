function popupJob(ref) {
  url = ref.href;
  newwindow = window.open(url,'name','height=600,width=800');
  if (window.focus) {newwindow.focus()}
  return false;
}

