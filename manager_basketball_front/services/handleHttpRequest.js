/* Servicio encargado de realizar las peticiones HTTP a la API
y devolver la respuesta de la API */

export class HandleHttpRequest {
    URL_API = 'http://localhost/gestio_basquet/manager_basketball_api/index.php';
    /* Como tenemos que espera a obtener una respuesta necesitamos una funcion asincrona */
    async httpRequest(method, endPoint, body = null) {
        const requestOptions = {
            method,
            headers: {
                'Content-Type': 'application/json'
            }
        };

        try {
            const url = this.URL_API;
            const response = await fetch(url, requestOptions);
            return await response.json();
        } catch (error) {
            console.error('Error en la solicitud:', error);
            throw error; 
        }
    }
}