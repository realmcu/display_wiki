// PDF 查看器简单封装
function embedPDF(containerId, pdfUrl, width, height) {
    const container = document.getElementById(containerId);
    if (container) {
        container.innerHTML = `<iframe src="${pdfUrl}" width="${width}" height="${height}" style="border:none;"></iframe>`;
    }
}
