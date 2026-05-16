# Lavalink Server for Glizh Music (Render Ready)

Servidor Lavalink optimizado para ser desplegado en Render.com usando Docker. Incluye soporte para Spotify, YouTube (OAuth) y SoundCloud mediante plugins.

## 🚀 Despliegue en Render.com

1. Crea un nuevo **Web Service** en Render.
2. Conecta este repositorio de GitHub.
3. Configura el **Runtime** como `Docker`.
4. En **Environment Variables**, añade todas las variables listadas abajo.
5. Selecciona el plan **Free** (o superior).

## 🛠️ Variables de Env. Necesarias (Configurar en Render)

| Variable | Descripción |
|----------|-------------|
| `SPOTIFY_CLIENT_ID` | Client ID de Spotify Developer Dashboard |
| `SPOTIFY_CLIENT_SECRET` | Client Secret de Spotify |
| `YOUTUBE_CLIENT_ID` | Client ID de Google Cloud Console (OAuth) |
| `YOUTUBE_CLIENT_SECRET` | Client Secret de Google Cloud Console |
| `GENIUS_TOKEN` | Access Token de Genius API |
| `PORT` | 2333 (Opcional, Render lo asigna) |

## 🔗 Configuración en el Bot (Vocard)

Para conectar tu bot a este servidor, edita el archivo `settings.json` de tu bot y añade este nodo:

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

## 🛡️ Mantener 24/7

Usa **UptimeRobot** para hacer un ping cada 5 minutos a la URL de tu servidor para evitar que el plan gratuito de Render entre en modo reposo.
