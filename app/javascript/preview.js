document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
  const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
     // 選択した画像を表示する関数

     const imageElement = document.createElement('div');
                                //<div></div>が生成される
    // 画像を表示するためのdiv要素を生成

    const blobImage = document.createElement('img');
                               // <input>が生成される
    // 表示する画像を生成
     blobImage.setAttribute('src', blob);
     blobImage.classList.add('preview-size');
    //  プレビューのサイズを調整
     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);
     // 親要素.appendChild(追加する子要素);
     // 生成したHTMLの要素をブラウザに表示させる
   };

  document.getElementById('item-image').addEventListener('change', function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    // 画像が表示されている場合のみ、すでに存在している画像を削除する

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    // 取得した画像情報のURLの生成

    createImageHTML(blob);
  });
  }
});