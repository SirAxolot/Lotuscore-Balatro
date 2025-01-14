import sys
from PIL import Image
import os
import glob

# script for resizing the 1x images into 2x images
# only runs inside of vscode? i dont know python that well. sorry
if __name__ == "__main__":
    for imgpath in os.listdir("./assets/1x/"):
        if imgpath.endswith(".png"):
            img = Image.open(os.path.join("./assets/1x/", imgpath))
            resized_image = img.resize((img.width * 2, img.height * 2), Image.NEAREST)

            filename = os.path.basename(imgpath)
            out_path = os.path.join("./assets/2x/", filename)
            resized_image.save(out_path)
            print(f"Saved to {out_path}")
    sys.exit(1)