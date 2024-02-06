document.getElementById('read-more').addEventListener('click', function () {
    var fullDescription = document.getElementById('full-description');
    var readMore = document.getElementById('read-more');

    fullDescription.style.display = 'block';

    readMore.style.display = 'none';
});

document.getElementById('disguise').addEventListener('click', function () {
    var fullDes = document.getElementById('full-description');
    var readM = document.getElementById('read-more');
    fullDes.style.display = 'none';
    readM.style.display = 'block'
});