import traceback

from gpiozero import MotionSensor

pir = MotionSensor(16)


def get_sensor():
    if pir.motion_detected:
        return 1
    
    else:
        return 0    
