const imgsList = product.imgs;
// Attach event to Add Image button
displayImages();

function createImageField(imageId = '', url = '') {
    let imageHtml = '';
    return `
            <div class="mb-2 image-field">
            <div class="row g-2 align-items-center">
                <div class="col-md-4">
                    <input class="form-control" type="hidden" name="imageIds[]" value="${imageId}">
                </div>
                <div class="col-md-5">
                    <input class="form-control" type="text" name="imageUrls[]" placeholder="Image URL" value="${url}" oninput="previewImage(this)">
                    <div class="invalid-feedback" style="color:red;"></div>
                </div>
                <div class="col-md-2">
                    <img src="${url}" alt="Image Preview" class="img-thumbnail" style="display: ${url ? 'block' : 'none'};">
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-danger btn-sm ms-2" onclick="removeImageField(this)">Remove</button>
                </div>
            </div>
        </div>
        `;
}

// Function to display existing images
function displayImages() {
    const container = document.getElementById('imageFieldsContainer');
    container.innerHTML = ''; // Clear the container
    imgsList.forEach(img => {
        container.innerHTML += createImageField(img.imageId, img.url); // Add image field
    });
}

// Function to add a new image field
function addImageField() {
    const container = document.getElementById('imageFieldsContainer');
    container.innerHTML += createImageField(); // Add an empty image field
}

// Function to remove an image field
function removeImageField(button) {
    button.closest('.image-field').remove();
}

// Function to preview the image based on the input URL
function previewImage(input) {
    const imgField = input.closest('.image-field');
    const imgPreview = imgField.querySelector('img'); // Get the img tag in the current field
    imgPreview.src = input.value;
    imgPreview.style.display = input.value ? 'block' : 'none'; // Show or hide the image
}
