#pragma once

#include <string>

enum PwmId {
    kPWM1_CHANNEL_0,
    kPWM1_CHANNEL_1,
    kPWM4_CHANNEL_0,
    kPWM4_CHANNEL_1,
    kPWM7_CHANNEL_0,
    kPWM7_CHANNEL_1
};

class Pwm {
private:
    PwmId pwmOutput;
    std::string pwmPath;
public:
    Pwm(PwmId pwmOutput);
    Pwm(PwmId pwmOutput, long period, long dutyCycle, bool enabledStatus = true);
    ~Pwm(void);
    void setEnabledStatus(bool enabledStatus);
    void setPeriod(long period);
    void setDutyCycle(long dutyCycle);
    void setDutyCyclePercentage(float percentage);
    bool getEnabledStatus(void);
    long getPeriod(void);
    long getDutyCycle(void);
    float getDutyCyclePercentage(void);
    PwmId getOutputChannel(void);
};
