# Lavalink Server

## 🚀 Despliegue en Render.com

1. Crea un nuevo **Web Service** en Render.
2. Conecta este repositorio de GitHub.
3. Configura el **Runtime** como `Docker`.
4. En **Environment Variables**, añade todas las variables listadas abajo.
5. Selecciona el plan **Free** (o superior).

## 🛠️ Variables de Env. Necesarias (Configurar en Render)

| Variable | Descripción |
|----------|-------------|
| `SPOTIFY_CLIENT_ID` | Client ID de Spotify |
| `SPOTIFY_CLIENT_SECRET` | Client Secret de Spotify |
| `YOUTUBE_CLIENT_ID` | Client ID de Google OAuth |
| `YOUTUBE_CLIENT_SECRET` | Client Secret de Google OAuth |
| `GENIUS_TOKEN` | Token de Genius API |
| `PORT` | 2333 |

## 🔗 Configuración en el Bot

```json
"Lavalink_Render": {
    "identifier": "Render Node",
    "host": "tu-app.onrender.com",
    "port": 443,
    "password": "glizhmusicpassword123",
    "secure": true,
    "heartbeat": 30
}
```
