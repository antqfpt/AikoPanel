import requests

currentDomain = 'aikocute.tech'  # Thay thế bằng giá trị thực tế của $currentDomain
uuid = 'db8ae9fe-2f10-4a45-b51a-ec6fa3ffeb36'  # Thay thế bằng giá trị thực tế của $this->uuid
license_key = 'V0G8TpuTsuEYznVr0VjzK8S8028AxWkc'  # Thay thế bằng giá trị thực tế của config('aikopanel.license')

data = {
    'domain': currentDomain,
    'uuid': uuid,
    'key': license_key
}

url = 'https://license.aikocute.net/client/verify'
response = requests.post(url, data=data)

if response.status_code == 200:
    # Xử lý dữ liệu phản hồi ở đây, ví dụ:
    response_data = response.json()
    print(response_data)
else:
    print('Yêu cầu không thành công. Mã trạng thái:', response.status_code)
