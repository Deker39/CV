#imports
try:
    import tkinter as tk
except:
    import Tkinter as tk
from PIL import Image, ImageTk
import argparse
import datetime
import cv2
import os

import cv2
import subprocess

from motion_sensor import get_sensor

recognizer = cv2.face.LBPHFaceRecognizer_create ( )
recognizer.read ( 'trainer/trainer.yml' )
cascadePath = "/home/pi/opencv/data/haarcascades/haarcascade_frontalface_default.xml"
faceCascade = cv2.CascadeClassifier ( cascadePath )

font = cv2.FONT_HERSHEY_SIMPLEX

program = " python /home/pi/dip/main.py"
# iniciate id counter
id = 0
# names related to ids: example ==> Marcelo: id=1,  etc
names = ['None', 'Alexey']


class Application:
    def __init__(self):
        """ Initialize application which uses OpenCV + Tkinter. It displays
            a video stream in a Tkinter window and stores current snapshot on disk """
        self.vs = cv2.VideoCapture(0) # capture video frames, 0 is your default video camera
        self.vs.set ( 3, 640 )  # set video widht
        self.vs.set ( 4, 480 )  # set video height
        self.current_image = None  # current image from the camera

        self.root = tk.Tk()  # initialize root window
        self.root.title("main")  # set window title
        self.root.configure ( background='black' )
        # self.destructor function gets fired when the window is closed
        self.root.protocol('WM_DELETE_WINDOW', self.destructor)

        self.panel = tk.Label(self.root)  # initialize image panel
        self.panel.configure ( background='black' )
        self.panel.pack(padx=10, pady=10)

               

        # start a self.video_loop that constantly pools the video sensor
        # for the most recently read frame
        self.video_loop()


    def video_loop(self):
        """ Get frame from the video stream and show it in Tkinter """
        ok, frame = self.vs.read()
        frame = cv2.flip ( frame, -1 )# read frame from video stream
        minW = 0.1 * self.vs.get ( 3 )
        minH = 0.1 * self.vs.get ( 4 )
        if get_sensor ( ):  # frame captured without any errors
            gray = cv2.cvtColor ( frame, cv2.COLOR_BGR2GRAY )# convert colors from BGR to gray
            faces = faceCascade.detectMultiScale (
                gray,
                scaleFactor=1.2,
                minNeighbors=5,
                minSize=(int ( minW ), int ( minH )),
                )
            for (x, y, w, h) in faces :
                cv2.rectangle ( frame, (x, y), (x + w, y + h), (0, 255, 0), 2 )
                id, confidence = recognizer.predict ( gray[y :y + h, x :x + w] )
                
                # Check if confidence is less them 100 ==> "0" is perfect match
                if (confidence < 100) :
                    kek = confidence
                    id = names[id]
                    confidence = "  {0}%".format ( round ( 100 - confidence ) )
                    if (kek > 60) :
                        # execfile("main.py", globals())
                        process = subprocess.Popen ( program, shell=True )
                        code = process.wait ( )
                else :
                    id = "unknown"
                    confidence = "  {0}%".format ( round ( 100 - confidence ) )
                    
                
            #frame=cv2.imshow ( 'camera', frame )
             
            self.current_image = Image.fromarray(gray)  # convert image for PIL
            imgtk = ImageTk.PhotoImage(image=self.current_image)  # convert image for tkinter
            self.panel.imgtk = imgtk  # anchor imgtk so it does not be deleted by garbage-collector
            self.root.attributes("-fullscreen",True)
            #self.oot.wm_state('zoomed')
            self.panel.config(image=imgtk)  # show the image
        else :
            cv2.destroyAllWindows ( )

        self.root.after(1, self.video_loop)  # call the same function after 30 milliseconds
        

    def destructor(self):
        """ Destroy the root object and release all resources """
        print("[INFO] closing...")
        self.root.destroy()
        self.vs.release()  # release web camera
        cv2.destroyAllWindows()  # it is not mandatory in this application


# start the app
print("[INFO] starting...")

pba = Application()
pba.root.mainloop()

