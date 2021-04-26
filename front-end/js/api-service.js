import * as CONSTANTS from './constants.js';

export class APIService {
    constructor() {}

    get(url) {
        return this.request(url, 'GET');
    }

    post(url, data) {
        return this.request(url, 'POST', data);
    }

    put(url, data) {
        return this.request(url, 'PUT', data);
    }

    delete(url) {
        return this.request(url, 'DELETE');
    }

    async request(url, method, data = null) {
        const response = await fetch(`${CONSTANTS.API_URL}${url}`, {
            method,
            headers: {
                'Content-type': 'application/json',
            },
            body: (data ? JSON.stringify(data) : null) 
        });
        try {
            const data = await response.json();
            return data;
        } catch(e) {
            return undefined;
        }
    }
}
