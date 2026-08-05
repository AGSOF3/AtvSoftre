var formData = null;
var fetchInterval;
var fetching = false;

$(document).ready(function() {
	
	const textarea = document.getElementById("message-input");

	textarea.addEventListener("input", autoGrow);
	
	function autoGrow() {
	    this.style.height = "42px";
	    this.style.height = Math.min(this.scrollHeight, 120) + "px";
	
	    if (this.scrollHeight > 120) {
	        this.style.overflowY = "auto";
	    } else {
	        this.style.overflowY = "hidden";
	    }
	}

	formData = new FormData();

	fetchChatMessages();

	$('#message-input').on('keydown', function(e) {
		if ((e.ctrlKey || e.metaKey) && (e.keyCode == 13 || e.keyCode == 10)) {
			e.preventDefault();
			let message = $('#message-input').val().trim(); //$('#message-input').text().trim();
			const file = formData.get('file');
			if (message != "" || file != null) {
				sendMessage(idAttivita, message, file);
			}
		}
	});

	$('#fileInput').change(function() {
		var file = $('#fileInput')[0].files[0];
		if (file) {
			formData.append('file', file);

			$('#fileInput').val('');
		}
	});

	$(document).on('click', '.attachment-image', function() {
		var imageUrl = $(this).attr('src');

		var modalHtml = '<div class="modal">' +
			'<div class="modal-content">' +
			'<span class="close">&times;</span>' +
			'<img src="' + imageUrl + '" class="modal-image">' +
			'</div>' +
			'</div>';

		$('body').append(modalHtml);

		$(document).on('click', '.close, .modal', function() {
			$('.modal').remove();
		});

		return false;
	});

	$('#chat-container').on('scroll', function() {
		if (!isAtBottom()) {
			stopFetchInterval();
		} else {
			startFetchInterval();
		}
	});

	$('#file-upload-icon').on('click', function() {
		$('#file-input').click();
	});

	$('#send-message-icon').on('click', function() {
		const file = formData.get('file');
		let message = $('#message-input').val().trim();//$('#message-input').text().trim();
		if (message != "" || file != null) {
			sendMessage(idAttivita, message, file);
		}
	});

	$('#file-input').on('change', function(event) {
		const file = event.target.files[0];
		if (file) {
			if (file.type.startsWith('image/')) {
				const reader = new FileReader();
				reader.onload = function(event) {
					displayImagePreview(event);
				};
				reader.readAsDataURL(file);
			} else {
				displayFileStatus(file.name);
			}
			formData.append('file', file);
		}
		$('#file-input').val('');
	});

	startFetchInterval();
	document.getElementById("message-input").addEventListener("paste", handlePaste);
});

function startFetchInterval() {
	fetchInterval = setInterval(function() {
		if (isAtBottom() && !fetching) {
			fetchChatMessages();
			fetching = true;
			console.log('Sono alla fine quindi fetch mex');
		}
	}, 3000);
}

function stopFetchInterval() {
	clearInterval(fetchInterval);
	fetching = false;
}

function isAtBottom() {
	const scrollTop = $('#chat-container').scrollTop();
	const innerHeight = $('#chat-container').innerHeight();
	//const scrollHeight = $('#chatBody')[0].scrollHeight;
	const scrollHeight = $('#chat-container')[0].scrollHeight;
	let lengthFigli = $('#chatBody').children().length;

	let isAtBottom = scrollTop + innerHeight >= scrollHeight;
	if (lengthFigli == 0)
		isAtBottom = false;
	return isAtBottom;
}

function displayImagePreview(event) {

    const previewContainer =
        document.getElementById("attachment-preview-container");

    // only one image supported
    previewContainer.innerHTML = "";

    const imageContainer = document.createElement("div");
    imageContainer.className = "image-preview";

    const img = document.createElement("img");
    img.src = event.target.result;

    const cross = document.createElement("span");
    cross.className = "cross-button";
    cross.innerHTML = "&times;";

    cross.onclick = function () {

        previewContainer.innerHTML = "";

        formData.delete("file");

    };

    imageContainer.appendChild(img);
    imageContainer.appendChild(cross);

    previewContainer.appendChild(imageContainer);

}

function displayFileStatus(fileName) {
	const fileStatusContainer = document.getElementById('file-status-container');
	fileStatusContainer.innerHTML = '';

	const fileStatus = document.createElement('div');
	fileStatus.className = 'file-status';
	fileStatus.id = 'file-status';

	const fileNameSpan = document.createElement('span');
	fileNameSpan.textContent = `File: ${fileName}`;

	const removeButton = document.createElement('button');
	removeButton.textContent = 'X';
	removeButton.className = 'remove-button';

	removeButton.addEventListener('click', function() {
		fileStatusContainer.innerHTML = '';
		formData.delete('file');
	});

	fileStatus.appendChild(fileNameSpan);
	fileStatus.appendChild(removeButton);
	fileStatusContainer.appendChild(fileStatus);
}

function handlePaste(event) {

    const items = event.clipboardData.items;

    for (let i = 0; i < items.length; i++) {

        const item = items[i];

        if (item.kind === "file" && item.type.startsWith("image/")) {

            event.preventDefault();

            const file = item.getAsFile();

			formData.delete("file");
			formData.append("file", file);
			
			const reader = new FileReader();
			
			reader.onload = function(e){
			
			    displayImagePreview(e);
			
			};
			
			reader.readAsDataURL(file);
			
			event.preventDefault();
			
			return;
        }
    }
}

function sendMessage(idAttivita) {
	stopFetchInterval();
	let file = null;
	if (formData.has('file')) {
		file = formData.get('file');
	}

	const data = new FormData();
	data.append('IdAttivita', idAttivita);
//	data.append('Message', $('#message-input').text());
	data.append('Message', $('#message-input').val());
	if (file) {
		data.append('file', file);
	}

	fetch(getURLWS() + '/softre/attivita/chat/ricevi', {
		method: 'POST',
		body: data,
		headers: {
			'Authorization': getBearerTokenFromLocalStorage()
		}
	}).then(response => {
		if (!response.ok) {
			throw new Error('Network response was not ok ' + response.statusText);
		} else {
			const textarea = document.getElementById("message-input");			
			textarea.value = "";
			textarea.style.height = "42px";
			textarea.style.overflowY = "hidden";
			formData.delete('file');
			document.getElementById(
			    "attachment-preview-container"
			).innerHTML = "";
			if (document.getElementById('file-status') != undefined && document.getElementById('file-status') != null) {
				document.getElementById('file-status').innerHTML = '';
			}
			document.getElementById('file-status-container').innerHTML = '';

			fetchChatMessages();

		}
		return response;
	}).catch(error => {
		console.error('Error sending message:', error);
	});
}

function downloadAttachment(element) {
    const input = element.parentNode.parentNode.querySelectorAll(".attachment-content")[0];
    if (!input) return;

    const base64 = input.value;
    const filename = input.dataset.filename;

    const binaryString = atob(base64);
    const len = binaryString.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; i++) {
        bytes[i] = binaryString.charCodeAt(i);
    }

    const mimeType = getMimeType(filename);

    const blob = new Blob([bytes], { type: mimeType });

    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    a.click();
    URL.revokeObjectURL(url);
}

function getMimeType(filename) {
    const ext = filename.split('.').pop().toLowerCase();
    switch (ext) {
        case 'png': return 'image/png';
        case 'jpg':
        case 'jpeg': return 'image/jpeg';
        case 'gif': return 'image/gif';
        case 'pdf': return 'application/pdf';
        case 'txt': return 'text/plain';
        case 'csv': return 'text/csv';
        case 'json': return 'application/json';
        case 'zip': return 'application/zip';
        case 'xml': return 'application/xml';
        case 'doc': return 'application/msword';
        case 'docx': return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
        case 'xls':
        case 'xlsx': return 'application/vnd.ms-excel';
        default: return 'application/octet-stream';
    }
}

function deleteMessage(idMessage) {
	fetch(getURLWS() + '/softre/attivita/chat/messaggio/elimina', {
		method: 'POST',
		body: JSON.stringify({
			"ChiaveMessaggio": idMessage
		}),
		headers: {
			'Authorization': getBearerTokenFromLocalStorage(),
			'Content-Type': 'application/json'
		}
	}).then(response => {
		if (!response.ok) {
			throw new Error('Network response was not ok ' + response.statusText);
		}
		return response;
	}).catch(error => {
		console.error('Error sending message:', error);
	});
	fetchChatMessages();
}

function fetchChatMessages() {
    $.ajax({
        url: getURLWS() + '/softre/attivita/chat/html',
        method: 'GET',
        data: {
            "IdAttivita": idAttivita,
        },
        beforeSend: function(xhr) {
            xhr.setRequestHeader('Authorization', getBearerTokenFromLocalStorage());
        },
        success: function(response) {
            var wasAtBottom = isAtBottom();

            $('#chat-container').html(response);

            if (wasAtBottom) {
                var chatContainer = document.getElementById("chat-container");
                chatContainer.scrollTop = chatContainer.scrollHeight;
            }

            fetching = false;
        },
        error: function(error) {
            console.error('Error fetching chat HTML:', error);
        }
    });
}