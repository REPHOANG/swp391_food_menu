<%-- 
    Document   : userDetailPage
    Created on : Feb 9, 2023, 12:10:55 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/showProductByCategoryPage.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/userDetailPage.css" />"/>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <title>JSP Page</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<c:if test="${empty sessionScope.user}">
    <script>
        window.location.href = "<c:url value="/" />"
    </script>
</c:if>
<div class="main-body">
    <div class="container">
        <div class="row-sidebar">
            <!-- left: sidebar -->
            <div class="sidebar-categories">
                <div class="block-sidebar-title">
                    <h5 class="sidebar-title"><i class="fa-regular fa-gem"></i>Tài khoản của tôi</h5>
                </div>
                <div class="block-sidebar-content">
                    <ul class="nav-list">
                        <li class="nav-list-item active">
                            <a href="#profile" class="nav-list-action" class="menu-categories-item-action">
                                Hồ sơ
                            </a>
                        </li>
                        <li class="nav-list-item">
                            <a href="#address" class="nav-list-action" class="menu-categories-item-action">
                                Địa chỉ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- right:detail-block -->
            <div class="user-detail-container">
                <div class="user-detail active" id="profile">
                    <div class="nav-user-detail">
                        <h3 class="user-detail-title">Hồ sơ của tôi</h3>
                    </div>
                    <div class="modals">
                        <div class="profile-modal">
                            <div class="profile">

                                <div class="profile-items">
                                    <div class="profile-item">
                                        <label>Email Đăng Nhập</label>
                                    </div>
                                    <div class="profile-item">
                                        ${sessionScope.user.email}
                                    </div>
                                </div>
                                <div class="profile-items">
                                    <div class="profile-item">
                                        <label>Tên</label>
                                    </div>
                                    <div class="profile-item">
                                        <input id="username" type="text"
                                               value='${sessionScope.user.username == null ? "" : sessionScope.user.username}'/>
                                    </div>
                                </div>
                                <div class="profile-items">
                                    <div class="profile-item">
                                        <label>Số điện thoại</label>
                                    </div>
                                    <div class="profile-item">
                                        <input id="phone" type="number" placeholder="Nhập số điện thoại"
                                               value="${sessionScope.user.phone}"/>
                                    </div>
                                </div>
                                <button type="button" id="submit">Lưu</button>
                            </div>
                            <div class="profile-avatar-container">
                                <div class="profile-avatar">
                                    <div class="current-avatar">
                                        <div id="my-image"
                                             style="background-image: url('${sessionScope.user.avatarUrl}')"></div>
                                    </div>
                                    <input id="input-avatar" type="file" hidden accept=".jpg, .jpeg, .png"
                                           onchange="readURL(this)"/>
                                    <!--<button id="submit">Upload</button>-->
                                </div>
                            </div>
                        </div>


                        <!--  -->

                        <!--  -->
                    </div>
                </div>

                <div class="user-detail" id="address">
                    <div class="nav-user-detail">
                        <h3 class="user-detail-title">Địa chỉ</h3>

                    </div>
                    <div class="address-modal">
                        <form>
                            <div class="address-modal-item">
                                <span class="label">Tỉnh/Thành phố:</span>
                                <select id="city" onchange="handleOnChangeCity(this.value)">
                                    <!--<option  value="one">Chọn Tỉnh/Thành phố</option>-->
                                </select>
                            </div>
                            <div class="address-modal-item">
                                <span class="label">Quận/Huyện:</span>
                                <select id="district" onchange="handleOnChangeDistrict(this.value)">
                                    <!--<option value="one">Chọn Quận/Huyện</option>-->

                                </select>
                            </div>
                            <div class="address-modal-item">
                                <span class="label">Phường/Xã:</span>
                                <select id="ward">
                                    <!--<option value="one">Chọn Phường/Xã</option>-->
                                </select>
                            </div>
                            <div class="address-modal-item">
                                <span class="label">Địa chỉ:</span>
                                <textarea class="address" placeholder="Nhập địa chỉ"
                                          rows="5">${sessionScope.user.address}</textarea>
                            </div>
                            <button type="button" id="submitAddress">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- jQuery base library needed -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="<c:url value="/assets/Javascript/handleImageInUserDetail.js" />"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    document.querySelector("#detailProduct.css" +
        "userDetailPage.cssAddress").addEventListener("click", function () {
        let addressDetail = document.querySelector(".address").value
        let wardID = document.querySelector("#ward").value
        let districtID = document.querySelector("#district").value
        if (wardID == '' || districtID == '') {
            return swal("Không được để trống!", "", "danger");
        }
        let xml = new XMLHttpRequest();
        console.log("wardID click" + wardID)
        console.log("address click" + addressDetail)
        xml.open('GET', "MainController?btnAction=address&addressAction=update&wardID=" + wardID + "&address=" + addressDetail, true)
        xml.onreadystatechange = function () {
            if (this.readyState == 4) {
                if (this.status < 300) {
                    return swal("Cập nhật thành công!", "", "success");
                } else {
                    return swal("Cập nhật không thành công!", "", "danger");
                }
            }
        }
        //yêu cầu gửi đi
        xml.send();
    })
    $("#ward").select2();
    $("#district").select2();
    $("#city").select2();

    function handleOnChangeCity(value, districtID) {
        fetch("MainController?btnAction=address&addressAction=district&cityID=" + value, {
            method: 'GET'
        })
            .then(res => res.json())
            .then(data => {
                let htmls = data.map(district => {
                    return `<option value="\${district.districtID}">\${district.name}</option>`
                })
                document.querySelector("#district").innerHTML = htmls.join('')
                $('#district').val(districtID).trigger("change")
                if (districtID) {
                    $('#district').val(districtID)
                }
            })
    }

    function handleOnChangeDistrict(value, wardID) {
        console.log(value)
        fetch("MainController?btnAction=address&addressAction=ward&districtID=" + value, {
            method: 'GET'
        })
            .then(res => res.json())
            .then(data => {
                console.log(data)
                let htmls = data.map(ward => {
                    console.log(`\${ward.wardID == wardID  ? 'selected' : ''}`)
                    return `<option \${ward.wardID == wardID ? 'selected' : ''} value="\${ward.wardID}">\${ward.name}</option>`
                })
                document.querySelector("#ward").innerHTML = htmls.join('')
                $('#ward').val(wardID);
            })
    }
    const fileInput = document.querySelector("#input-avatar");
    console.log(document.querySelector("#my-image"))
    document.querySelector("#my-image").addEventListener("click", () => fileInput.click());
    window.onload = function () {
        console.log("load")
        if (${not empty sessionScope.user.wardID}) {
            fetch("MainController?btnAction=address&addressAction=getWard&wardID=" + `${sessionScope.user.wardID}`, {
                method: 'GET'
            })
                .then(res => res.json())
                .then(ward => {
                    console.log(ward)
                    console.log(ward.districtID, ward.wardID)
                    handleOnChangeDistrict(ward.districtID, ward.wardID)
                    return new Promise(function (res) {
                        return res(
                            fetch("MainController?btnAction=address&addressAction=getDistrict&districtID=" + `\${ward.districtID}`, {
                                method: 'GET'
                            }))
                    })
                })
                .then(data =>
                        data.json()
                )
                .then(district => {
                        console.log(district)
                        console.log(district.cityID, district.districtID)
                        handleOnChangeCity(district.cityID, district.districtID)
                        return new Promise(function (res) {
                            return res(
                                fetch("MainController?btnAction=address&addressAction=getCity&cityID=" + `\${district.cityID}`, {
                                    method: 'GET'
                                }))
                        })
                    }
                )
                .then(res => res.json())
                .then(city => {
                    console.log("test:" + city.name)
                    document.querySelector("#city").innerHTML = "<option value='\${city.cityID}'>" + city.name + "</option>"
                    showCity(city.cityID)
                })
        } else {
            console.log("asdadads")
            showCity()
        }
    }

    function showCity(cityID) {
        fetch("MainController?btnAction=address&addressAction=city", {
            method: 'GET'
        }).then(res => res.json())
            .then(data => {
                console.log(data)
                $('#city').on("select2:open", function (e) {
                    let htmls = data.map(city => {
                        return `<option value="\${city.cityID}">\${city.name}</option>`
                    })
                    document.querySelector("#city").innerHTML = htmls.join('')
                    if (!cityID) {
                        cityID = {}
                        $('#city').val("<option>Chọn thành phố</option>")
                    } else {
                        $('#city').val(cityID).trigger('change')
                    }
                })
            });
    }

    const navListItems = document.querySelectorAll(".nav-list-item")
    const userDetails = document.querySelectorAll(".user-detail")
    navListItems.forEach((item, index) => {
        item.addEventListener('click', function () {
            navListItems.forEach((_item, _index) => {
                _item.classList.remove("active")
                userDetails[_index].classList.remove("active")
            })
            item.classList.add("active")
            userDetails[index].classList.add("active")
        })
    })
</script>


<script type="module">
    // Import the functions you need from the SDKs you need
    import {initializeApp} from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
    import {
        listAll,
        getStorage,
        ref,
        getDownloadURL,
        deleteObject,
        uploadBytesResumable,
        uploadBytes
    } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-storage.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
    // Your web app's Firebase configuration
    const firebaseConfig = {
        apiKey: "AIzaSyDME5p-3eVnBjOe1PMqhAGZgeTQrg64_rA",
        authDomain: "storageavataruser.firebaseapp.com",
        projectId: "storageavataruser",
        storageBucket: "storageavataruser.appspot.com",
        messagingSenderId: "703858060708",
        appId: "1:703858060708:web:ad4795d735b1fd6882a531"
    };
    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const storage = getStorage();
    const listRef = ref(storage, 'userID-${sessionScope.user.userId}/avatar');
    console.log(listRef);
    document.querySelector('#submit').addEventListener('click', function () {
        var http = new XMLHttpRequest();
        const avatar = document.querySelector('#input-avatar').files[0];
        if (avatar != undefined) {
            listAll(listRef)
                .then((res) => {
                    res.items.forEach((itemRef) => {
                        deleteObject(itemRef)
                            .then(() => {
                                console.log('deleted')
                            })
                    });
                })
            const storageRef = ref(storage, 'userID-${sessionScope.user.userId}/avatar/' + avatar.name);
            uploadBytes(storageRef, avatar)
                .then((snapshot) => {
                    console.log(snapshot)
                    console.log('Uploaded');
                    return snapshot
                })
                .then(snapshot => {
                    return getDownloadURL(snapshot.ref)
                })
                .then(url => {
                    console.log(url)
                    // Yêu cầu GET vs API, cbi yêu cầu để kết nối
                    http.open('GET', 'MainController?btnAction=user&userAction=updateProfile&urlAvatar=' + url
                        + '&email=' + '${sessionScope.user.email}'
                        + '&phone=' + document.querySelector('#phone').value
                        + '&username=' + document.querySelector('#username').value
//                                + '&token=' + getParameterByName('token', url)
                        , true)//true: bất đồng bộ( call api delay vài giây thì các code dưới vẫn chạy bt)
                    http.onreadystatechange = function () {
                        //trường hợp đã gửi req thành công và nhận dc response
                        //và status < 300: không lỗi thì cho resolve để .then
                        //trả về resolve or reject tùy vào if else dưới
                        //
                        if (this.readyState == 4) {
                            if (this.status < 300) {
                                return swal("Updated succesfully!", "", "success");
                            } else {
                                return swal("Updated unsuccesfully!", "", "danger");
                            }
                        }
                    }
                    //yêu cầu gửi đi
                    http.send();
                    return url
                })
                .then(url => {
                    document.querySelector('#my-avatar-header').style.backgroundImage = "url('" + url + "')";
                })
        } else {
            let url = document.querySelector('#my-image').style.backgroundImage.slice(5, -2)
            http.open('GET', 'MainController?btnAction=user&userAction=updateProfile&urlAvatar=' + url
                + '&email=' + '${sessionScope.user.email}'
                + '&phone=' + document.querySelector('#phone').value
                + '&username=' + document.querySelector('#username').value
//                                + '&token=' + getParameterByName('token', url)
                , true)//true: bất đồng bộ( call api delay vài giây thì các code dưới vẫn chạy bt)
            http.onreadystatechange = function () {
                //trường hợp đã gửi req thành công và nhận dc response
                //và status < 300: không lỗi thì cho resolve để .then
                //trả về resolve or reject tùy vào if else dưới
                //
                if (this.readyState == 4) {
                    if (this.status < 300) {
                        return swal("Updated succesfully!", "", "success");
                    } else {
                        return swal("Updated unsuccesfully!", "", "danger");
                    }
                }
            }
            //yêu cầu gửi đi
            http.send();
        }
    })
</script>
</html>
