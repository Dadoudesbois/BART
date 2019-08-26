const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navbarIsWhite = JSON.parse(navbar.dataset.isNavbarWhite);

  if (navbar) {
    if (navbarIsWhite) navbar.classList.add('navbar-lewagon-white');
    window.addEventListener('scroll', () => {
      if (navbarIsWhite) return
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
