$(document).ready(function(){
    const modal1 = document.querySelector('.modal_layer')
    function modalOn() {
      modal1.style.display = "flex"
    }
    function modalOff() {
      modal1.style.display = "none"
    }
    
    const btnModal = document.getElementById("modal_open_btn")
    btnModal.addEventListener("click", e => {
        modalOn()
    })
    const closeBtn = modal.querySelector("#modal_close_btn")
    closeBtn.addEventListener("click", e => {
        modalOff()
    })
})