## GIO Docker Desktop
This guide outlines the steps to set up the GIO server using Docker Desktop on your Windows system with WSL (Windows Subsystem for Linux) enabled.

What are the benefits of playing this old version? You can relive some of the most nostalgic past events that will never come back forever, such as: Windblume (1.4), Golden Apple Archipelago (1.6 & 2.8), Shadows Amidst Snowstorms (2.3), Three Realms Gateway Offering (2.5), and The Lantern Rite (1.3 & 2.4). Also, you can play Ayaka (the character released in 2.0) in CBT. 

### Preparation
- Install [Docker Desktop][1]
- Download [Game Client][2]
- Download [server bins][3] and place them in the `server` folder.
- Download [server data][4] (json, lua, txt, xml, version.txt) and place it in the `server/data` folder.
- Download [sdkserver][5] and place it in the `server/sdkserver` folder.
- Download [Game Patch][6]
- Download [FurinaImpact.Proxy][7]

### System Setup:
1. **Enable WSL (Windows Subsystem for Linux)**:
   - Open `Turn Windows feature on or off` from the Windows search bar.
   - Check the boxes for `Windows Subsystem for Linux` and `Virtual Machine Platform`.
   - Restart your computer.

2. **Update WSL**:
   - Open a terminal and run:
     ```bash
     wsl --update
     ```

### Server Setup:
1. **Initial Setup**:
   - Run the Docker setup using the provided `bootstrap.bat` file (no need to run Docker commands manually).
   - For future uses, you can start the server using `start.bat`.
   
2. **Server Initialization**:
   - Wait approximately 15 minutes for the server to debug and be ready.

3. **Apply Game Patch**:
   - Place the downloaded game patch into the same folder as the game's executable file (.exe).

4. **Run FurinaImpact.Proxy**:
   - Set the port to `21000`.

5. **Playing the Game**:
   - You can now enjoy the game.
   - You can register an account on the game's login screen (no real email is needed). For CB1, register via the browser at `http://localhost:21000/`.

6. **For GIO 3.0**:
   - Use the [2.8.50 beta client][8] instead of the 3.0 client.
   
7. **For GIO 3.3, 3.4**:
   - You should use **ProtoShift** to make 3.3, 3.4 GIO support!

### Accessing the Database:
- Open MySQL via a web browser at `http://localhost:8087/`.
- Username: `root`
- Password: (check the `.env` file for the password).

[1]: https://www.docker.com  
[2]: https://github.com/GesthosNetwork/GI-Game-Client/tree/main/PC%20Client 
[3]: https://www.mediafire.com/folder/euuny06zqca27  
[4]: https://www.mediafire.com/folder/9vc51iejddzj5  
[5]: https://www.mediafire.com/folder/y7lmv16up22vw  
[6]: https://github.com/GesthosNetwork/GI-Patches-Collection  
[7]: https://github.com/GesthosNetwork/FurinaImpact.Proxy/releases/download/v1.0.0/FurinaImpact.Proxy.zip  
[8]: https://autopatchhkbeta.yuanshen.com/client_app/download/beta_pc/20220708104232_lwGnJdsYwFVCZDTT/GenshinImpact_2.8.50_beta.zip
