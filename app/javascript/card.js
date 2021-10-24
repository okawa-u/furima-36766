const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  Payjp.setPublicKey("pk_test_edfd6e7a0e55189a300f5616");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    // フォーム送信時にイベントを発火

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase[number]"),
      cvc: formData.get("purchase[cvc]"),
      exp_month: formData.get("purchase[exp_month]"),
      exp_year: `20${formData.get("purchase[exp_year]")}`,
    }; 
    // フォームの情報の取得

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // カードの情報をトークン化
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // トークンの値をフォームに含める
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // フォームに存在するクレジットカードの各情報を削除

      document.getElementById("charge-form").submit();
      // フォームの情報をサーバーサイドに送信
    });
  });
};

window.addEventListener("load", pay);
// ページが読み込まれた時に、payという変数に代入したアロー関数が実行される
