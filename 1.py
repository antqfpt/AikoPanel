import requests

def get_record_ids(api_endpoint, token, zoneid):
    headers = {
        'Authorization': f'Bearer {token}',
        'Content-Type': 'application/json'
    }
    params = {'zoneid': zoneid}
    response = requests.get(api_endpoint, headers=headers, params=params)
    
    if response.status_code == 200:
        records = response.json()
        record_ids = [record['id'] for record in records]
        return record_ids
    else:
        return f"Error: {response.status_code}"

# Thay thế với thông tin của bạn
api_endpoint = 'your_api_endpoint'
token = 'your_token'
zoneid = 'your_zoneid'

# Lấy Record IDs
record_ids = get_record_ids(api_endpoint, token, zoneid)
print(record_ids)
