function showHide(id) {


  if (id === "profile-register-block") {
    document.getElementById("profile-register-block").style.display= "block";
    document.getElementById("profile-login-block").style.display= "none";
  }
  else {
    document.getElementById("profile-register-block").style.display= "none";
    document.getElementById("profile-login-block").style.display= "block";
  }

  // var e = document.getElementById(id);
  // if (e.style.display === "block") {
  //   e.style.display = "none";
  // }
  // else {
  //   e.style.display = "block";
  // }
}
