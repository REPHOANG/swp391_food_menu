/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function readURL(input) {
    console.log(input.files[0])

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
//            console.log(e.target.result)
            document.querySelector("#my-image").style.backgroundImage = "url('" + e.target.result + "')";


        };

        reader.readAsDataURL(input.files[0]);
    }
   
}

                                        