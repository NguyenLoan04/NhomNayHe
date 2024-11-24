function changeFormOnCategory(btn) {
    $('#formWrapper').css({
        'display': 'flex',
        'justify-content': 'center',
        'align-items': 'center'
    });
    
    const formWrapper = document.getElementById('formWrapper');
    switch (btn) {
        case 'addCategoryBtn':
            formWrapper.innerHTML = `<iframe src="category-form/add-category-form.html" class="form-popup" id="addIframe"></iframe>`;
            const add_iframe = document.getElementById('addIframe');

            // Lắng nghe sự kiện load để đảm bảo iframe đã tải xong
            add_iframe.addEventListener('load', function () {
                const c = add_iframe.contentWindow;
                if(c.getHeightForm() < screen.height) {
                    $('#addIframe').css('height', c.getHeightForm() + 'px');
                } else {
                    $('#addIframe').css('height', (screen.height -170) + 'px');
                }
            });
            break;
        case 'readAndEditUserBtn':
            formWrapper.innerHTML = `<iframe src="category-form/read-edit-category-form.html" class="form-popup" id="readAndEditIframe"></iframe>`;
            const re_iframe = document.getElementById('readAndEditIframe');

            // Lắng nghe sự kiện load để đảm bảo iframe đã tải xong
            re_iframe.addEventListener('load', function () {
                const c = re_iframe.contentWindow;
                if(c.getHeightForm() < screen.height) {
                    $('#readAndEditIframe').css('height', c.getHeightForm() + 'px');
                } else {
                    $('#readAndEditIframe').css('height', (screen.height -170) + 'px');
                }
            });
            break;
        case 'deleteBtn':
            formWrapper.innerHTML = `<iframe src="category-form/delete-popup.html" class="form-popup" id="deleteIframe"></iframe>`;
            const del_iframe = document.getElementById('deleteIframe');

            // Lắng nghe sự kiện load để đảm bảo iframe đã tải xong
            del_iframe.addEventListener('load', function () {
                const c = del_iframe.contentWindow;
                if(c.getHeightForm() < screen.height) {
                    $('#deleteIframe').css('height', c.getHeightForm() + 'px');
                } else {
                    $('#deleteIframe').css('height', (screen.height -170) + 'px');
                }
            });
            break;
    }
}

$('#myTable').DataTable().on('draw', function () {
    $('#addCategoryBtn').click(function () {
        changeFormOnCategory(this.id);
        $('#formWrapper').removeClass('hidden');

        $('#addIframe').on('load', function () {
            const iframeDoc = $(this).contents();
            // Gán sự kiện vào phần tử bên trong iframe
            iframeDoc.find('#cancelBtn').on('click', function () {
                hiddenOverlay();
            });
        });
    });

    $('.btn-read-edit').click(function () {
        changeFormOnCategory('readAndEditUserBtn');
        $('#formWrapper').removeClass('hidden');

        $('#readAndEditIframe').on('load', function () {
            const iframeDoc = $(this).contents();

            // Gán sự kiện vào phần tử bên trong iframe
            iframeDoc.find('#cancelBtn').on('click', function () {
                hiddenOverlay();
            });

        });

    });

    $('.btn-delete').click(function () {
        changeFormOnCategory('deleteBtn');
        $('#formWrapper').removeClass('hidden');

        $('#deleteIframe').on('load', function () {
            const iframeDoc = $(this).contents();

            // Gán sự kiện vào phần tử bên trong iframe
            iframeDoc.find('#cancelBtn').on('click', function () {
                hiddenOverlay();
            });
        });

    });

});

$('#formWrapper').click(function () {
    hiddenOverlay();
});

function hiddenOverlay() {
    $('#formWrapper').css({
        'display': 'none',
        'justify-content': 'none',
        'align-items': 'none'
    });
}
