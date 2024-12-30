# Player Mood Script for FiveM

![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Overview

The Player Mood Script is a dynamic and interactive FiveM resource that enhances player expression by allowing them to display their current mood in-game. This is achieved through visual indicators, such as emojis and colors, that appear above the player's character. The script is designed to enrich role-playing experiences by providing a simple yet effective way to convey emotions.

## Features

- **Diverse Mood Options**: Choose from a variety of moods including Happy, Sad, Disappointed, Neutral, and Hide.
- **Visual Indicators**: Each mood is represented by a unique emoji and color, making it easy for others to recognize your mood at a glance.
- **Cooldown System**: A built-in cooldown prevents players from changing moods too frequently, ensuring fair play and reducing spam.
- **User-Friendly Commands**: Simple commands allow players to set or hide their mood effortlessly.

## Installation

To get started with the Player Mood Script, follow these steps:

1. **Download the Script**: Clone or download the repository to your local machine.

   ```bash
    git clone https://github.com/TalosTheMinoan/Playermood
   ```

2. **Add to FiveM Server**: Place the `playermood` folder into your FiveM server's `resources` directory.

3. **Update server.cfg**: Add the following line to your `server.cfg` to ensure the resource starts when the server does.

   ```plaintext
   start playermood
   ```

4. **Restart Server**: Restart your FiveM server to load the new resource and begin using the Player Mood Script.

## Usage

- **Set Mood**: Use the command `/setmood [mood]` to set your mood. Available moods are `happy`, `sad`, `disappointed`, `neutral`, and `hide`.

  Example:
  ```plaintext
  /setmood happy
  ```

- **Cooldown Notification**: If you attempt to change your mood before the cooldown period ends, you will receive a notification indicating the remaining time.

## Configuration

The script is pre-configured with default moods and a cooldown time of 60 seconds. You can modify these settings directly in the `playermood.lua` and `playermood_client.lua` files.

### Adding New Moods

To add new moods, follow these steps:

1. **Edit the Server Script**: Open `playermood.lua` and locate the `moods` table. Add a new entry for your mood with an emoji and color.

   ```lua
   local moods = {
       happy = {emoji = "😊", color = {r = 0, g = 255, b = 0}},
       sad = {emoji = "😢", color = {r = 0, g = 0, b = 255}},
       disappointed = {emoji = "😞", color = {r = 255, g = 165, b = 0}},
       neutral = {emoji = "😐", color = {r = 255, g = 255, b = 255}},
       hide = {emoji = "", color = {r = 0, g = 0, b = 0}},
       excited = {emoji = "😃", color = {r = 255, g = 255, b = 0}} -- New mood example
   }
   ```

2. **Edit the Client Script**: Open `playermood_client.lua` and add the same entry to the `moods` table.

3. **Save and Restart**: Save your changes and restart the FiveM server to apply the new mood.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please open an issue on GitHub.

---

Thank you for using the Player Mood Script! We hope it enhances your FiveM experience and adds a new layer of interaction to your gameplay.