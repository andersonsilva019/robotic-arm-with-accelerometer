all: app
	scp bin/robotic debian@192.168.7.2:/home/debian

app: main.o pwm.o servo.o common.o accelerometer.o i2c.o roboticarm.o gpio.o
	arm-linux-gnueabihf-g++ --static obj/main.o obj/pwm.o obj/common.o obj/servo.o obj/i2c.o obj/accelerometer.o obj/roboticarm.o obj/gpio.o -o bin/robotic

main.o: src/main.cpp
	arm-linux-gnueabihf-g++ --static -c src/main.cpp -Iinc -o obj/main.o

pwm.o: src/pwm.cpp
	arm-linux-gnueabihf-g++ --static -c src/pwm.cpp -Iinc -o obj/pwm.o

servo.o: src/servo.cpp
	arm-linux-gnueabihf-g++ --static -c src/servo.cpp -Iinc -o obj/servo.o

common.o: src/common.cpp
	arm-linux-gnueabihf-g++ --static -c src/common.cpp -Iinc -o obj/common.o

i2c.o: src/i2c.cpp
	arm-linux-gnueabihf-g++ --static -c src/i2c.cpp -Iinc -o obj/i2c.o

accelerometer.o: src/accelerometer.cpp
	arm-linux-gnueabihf-g++ --static -c src/accelerometer.cpp -Iinc -o obj/accelerometer.o

roboticarm.o: src/roboticarm.cpp
	arm-linux-gnueabihf-g++ --static -c src/roboticarm.cpp -Iinc -o obj/roboticarm.o

gpio.o: src/gpio.cpp
	arm-linux-gnueabihf-g++ --static -c src/gpio.cpp -Iinc -o obj/gpio.o
run: 
	./bin/robotic

clean:
	rm obj/*.o bin/exec