async function connect_wallet() {
    if (!window.ethereum) {
        alert('MetaMask not detected. Please install MetaMask first.');
        return;
    }
    const web3 = new Web3(window.ethereum);
    const message = [
        "Sign this message to confirm you own this wallet address. This action will not cost any gas fees.",
    ].join("\n");
    const address = (await web3.eth.requestAccounts())[0];
    const signature = await web3.eth.personal.sign(message, address);
    await $.ajax({
        type: 'POST',
        headers: {
            'accept': 'application/json'
        },
        data: {
            message: message,
            address: address,
            signature: signature,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        url: '/meta-mask-login',
        success: function (response) {
            window.location.href = response.url;
        }
    })
}
