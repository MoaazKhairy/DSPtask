#Group4 Asmaa Morad - Laila Mohamed - Moaz Khairy
#Program run as main window contains getting signal and it's plot and buttons for opening subwindows
#Filtration SubWindow for applying digital filter on the obtained signal
#Sampling SubWindow for sampling nature signals
#SoundGeneration Subwindow for generating sound from sinusoids

import matplotlib
import matplotlib.pyplot as plt
matplotlib.use('TkAgg')
import numpy as np
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
from tkinter import *
from tkinter.filedialog import askopenfilename
import csv
from csv import reader

class MClass:

    def __init__(self,  window):
        self.window = window
        window.geometry('700x700+200+0')
        window.title('DSP Task2')
        label1 = Label(text="Browse CSV Signal: ", fg='black', bg='yellow').place(x =0,y=0)

        self.OpenBut = Button(window, text='File Open', command= self.CallBack).place(x=0,y=30)
        self.PlotBut = Button(window, text = 'Plot' , command = self.PlotSignal).place(x = 70, y=30)

        self.FiltrationBut = Button(window, text='Filtration', command= self.Filtration).place(x=150,y=30)
        self.SamplingBut = Button(window, text='Sampling Nature Signals', command= self.Sampling).place(x=240,y=30)
        self.SoundGenerationBut = Button(window, text='Sound Generation', command= self.CallBack).place(x=400,y=30)


    def Sampling(self):
        SamplingW = Tk()
        #SamplingW.geometry('200x200+200+0')
        SamplingW.title('Sampling')

        self.ButExp = Button(SamplingW,text='Sample Exponential wave', command=self.callback1, fg="black", bg="green").pack(fill = X)
        self.ButSin = Button(SamplingW, text='Sample Sin wave', command=self.callback2, fg="black", bg="green").pack(fill = X)
        mainloop()

    def callback1(self):
        A = 2
        f = 50.0
        T = 1 / f

        fs = 50.0 * f
        Ts = 1 / fs

        cycles = 2
        t = np.arange(0, cycles * T, Ts)
        x = np.exp(f * t)

        plt.title("Sampled Decay exponential Capacitor ")
        plt.stem(x)
        plt.show()

    def callback2(self):
        A = 2
        f = 50.0
        T = 1 / f

        fs = 50.0 * f
        Ts = 1 / fs

        cycles = 2
        t = np.arange(0, cycles * T, Ts)
        x = A * np.sin(2 * np.pi * f * t)
        plt.title("Harmonic motion ")
        plt.stem(x)
        plt.show()





    def Filtration(self):
        global WindowFiltration
        WindowFiltration = Tk()
        WindowFiltration.geometry('700x700+200+0')
        WindowFiltration.title('DSP Task2')

        #global FirstFactor
        #FirstFactor= int
        #name = StringVar()  # 6
        #nameEntered = Entry(WindowFiltration, width=12, textvariable=name)  # 7
        #nameEntered.grid(column=0, row=1)  # 8
        #self.Click = Button(WindowFiltration,text = 'Enter',command = self.clickMe).pack()

        #def clickMe(self):  # 2
         #   M =  name.get()
          #  print(M)

        #Label2 = Label(text = 'Enter Filter Vector: ',fg='black', bg='yellow').place(x=0,y=0)
        #E = Entry(WindowFiltration ).pack()
        #self.PlotFBut = Button(WindowFiltration,text = 'Plot', command = self.PlotFiltration).place(x = 10 , y =30)
        #m = E.get()


    def GetFirst(self):
        f = FirstFactor.get()
        print(f)

    def PlotFiltration(self):
        filter = [-1,0,1]
        fig = Figure(figsize=(6, 6))
        a = fig.add_subplot(111)
        x_1 = list(Signal)
        x = [float(m) for m in x_1]
        y = np.convolve(filter, x)
        a.plot(Signal, color='blue')
        a.plot(y, color='red')
        canvas = FigureCanvasTkAgg(fig, WindowFiltration)
        canvas.get_tk_widget().pack()
        canvas.draw()


    def CallBack(self):
        name = askopenfilename(filetypes=[("CSV", ".csv")])
        with open(name, 'r') as f:
            data = list(reader(f))
            global Signal
            Signal_1 = np.asarray(data)
            Signal = Signal_1[:,0]

    def PlotSignal(self):
        fig = Figure(figsize=(6, 6))
        a = fig.add_subplot(111)
        a.plot(Signal, color='blue')
        canvas = FigureCanvasTkAgg(fig, master=self.window)
        canvas.get_tk_widget().place(x = 10 , y =60)
        canvas.draw()


Window = Tk()
m1 = MClass(Window)
mainloop()