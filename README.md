GitHub Copilot: # BestSelf

BestSelf es una aplicación móvil diseñada para ayudarte a monitorear y mejorar tus hábitos diarios. La aplicación te permite crear, actualizar y seguir tus hábitos, proporcionando una interfaz amigable y motivacional.

## Características

- **Monitoreo de Hábitos**: Crea y sigue tus hábitos diarios.
- **Interfaz de Usuario Intuitiva**: Diseño limpio y fácil de usar.
- **Mensajes Motivacionales**: Recibe mensajes motivacionales para mantenerte enfocado.
- **Navegación Fácil**: Barra de navegación personalizada para un acceso rápido a las funciones principales.

## Tecnologías Utilizadas

- **Flutter**: Framework para el desarrollo de aplicaciones móviles.
- **GetX**: Gestión de estado y navegación.
- **Confetti**: Efectos visuales para mejorar la experiencia del usuario.

## Estructura del Proyecto

```plaintext
lib/
├── app/
│   ├── UI/
│   │   ├── config/
│   │   │   └── routes.dart
│   │   ├── controllers/
│   │   │   ├── habit_controller.dart
│   │   │   └── user_controller.dart
│   │   ├── pages/
│   │   │   ├── home/
│   │   │   │   ├── home_page.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── daily_widget.dart
│   │   │   │   │   └── mascota_screen.dart
│   │   │   ├── create_habit/
│   │   │   │   └── create_habit.dart
│   │   │   ├── splash_screen.dart
│   │   │   └── user-config/
│   │   │       └── user_config.dart
│   │   ├── widgets/
│   │   │   ├── app_bar.dart
│   │   │   ├── botton_navigation_bar.dart
│   │   │   └── habit_card.dart
│   ├── data/
│   │   ├── local/
│   │   │   ├── database_habit.dart
│   │   │   ├── i_local_habit_source.dart
│   │   │   └── loca_habit_source.dart
│   │   ├── remote/
│   │   │   ├── i_remote_habit_source.dart
│   │   │   └── remote_habit_source.dart
│   │   ├── repositories/
│   │   │   └── habit_repository_impl.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── habit.dart
│   │   ├── repositories/
│   │   │   └── i_habit_repository.dart
│   │   └── uses_cases/
│   │       └── habit_use_cases.dart
├── main.dart
```


## DEMO

Link del demo [Drive](https://drive.google.com/file/d/1OevE8vCmF_UuYGNyntKTpl-D7ID4rp1Y/view?usp=drivesdk)

---

¡Gracias por usar BestSelf! Esperamos que te ayude a alcanzar tus metas y mejorar tus hábitos diarios.
