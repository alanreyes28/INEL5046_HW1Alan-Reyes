%%Hecho por Alan Reyes 
%INEL5046 Machine Learning and Pattern Recognition
%Matlab HomeWork 1:
 
%**********************INSTRUCTIONS**********************%
%Generate 1000 samples of each bit 0 and 1. 
%Add Gaussian random noise using the Matlab function.  
%Use 50% of samples to determine a threshold value that can 
% be used as a classifier, to classify the bits with noise 
% in class 0 or 1.  Classify the rest of the samples.  
% (1) Draw a histogram for the training data and testing data. 
% (2) Compute the Expected value and average error of misclassification 
% of each class (for the 500 training samples, and the 500 testing samples).
%Send a report with the above results. 
%Also include the Matlab/Python code in the word document 
%and send me the word file or a pdf file.
%********************************************************%
 
%%Cerrar todas las applicaciones de MatLab
close all
clc
 
%%Se Crean dos datos
EntradasDeCeros = zeros(10,100); %Un arreglo 10*100 de mil ceros
EntradasDeUnos = ones(10,100); %Un arreglo 10*100 de mil unos
 
%%Calculo de ruido gausiano
snr=10;
t = 1:10:100;
EDC_nn = awgn(EntradasDeCeros, snr, 'measured'); %Entrada de Ceros Con Ruido
EDU_nn = awgn(EntradasDeUnos, snr, 'measured'); %Entrada de Unos Con Ruido
 
 
%*********************************
%**********Signals Plots**********
%*********************************
 
%%Grafica de Entradas de Ceros
figure('Name','Input Zeros Signal');
plot(t, EntradasDeCeros, 'r', 'Linewidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Input Zeros Signal');
grid on;
 
%%Grafica de Entradas de Unos
figure('Name','Input Unos Signal');
plot(t, EntradasDeUnos, 'b', 'Linewidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Input Unos Signal');
grid on;
 
%%Grafica de Entradas de Ceros con Ruido 
figure('Name','Input Ceros Signal Con Ruido');
plot(t, EDC_nn, 'r', 'Linewidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Input Ceros Signal Con Ruido');
grid on;
 
 
%%Grafica de Entradas de Unos con Ruido
figure('Name','Input Unos Signal Con Ruido');
plot(t, EDU_nn, 'b', 'Linewidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Input Unos Signal Con Ruido');
grid on;
 
 
%%Ahora procedemos a dividir los datos con ruido por la mitad
 
DataEntrenamiento1 = EDC_nn(1:5,1:50);
DataEntrenamiento2 = EDU_nn(1:5,1:50);
 
DataPrueba1 = EDC_nn(6:10,51:100);
DataPrueba2 = EDU_nn(6:10,51:100);
 
 
%%Calculamos el Valor Umbral
Promedio_1 = mean(DataEntrenamiento1);
Promedio_2 = mean(DataEntrenamiento2);
 
%%Se suman las medias
UmbralPrueba = (Promedio_1 + Promedio_2)/2;
 
%%Se usa la umbral para probar si el valor es mayor o menor 
ConteoDeCeros = 0;
ConteoDeUnos = 0;
 
 
for index = 1 : length(DataPrueba1)
    EsMenorQue = DataPrueba1(index) < UmbralPrueba(index);
    if(EsMenorQue == true)
        ConteoDeCeros = ConteoDeCeros + 1;
    end
end
 
ConteoDeCeros;
 
for index = 1 : length(DataPrueba1)
    EsMenorQue = DataPrueba1(index) < UmbralPrueba(index);
    if(EsMenorQue == true)
        ConteoDeUnos = ConteoDeUnos + 1;
    end
end
 
ConteoDeUnos;
 
%%Dibujando el histograma de la clase 
 
figure('Name', 'Histograma de la DataEntrenamiento1');
histogram(DataEntrenamiento1);
 
figure('Name', 'Histograma de la DataEntrenamiento2');
histogram(DataEntrenamiento2);
 
figure('Name', 'Histograma de la DataPrueba1');
histogram(DataPrueba1);
 
figure('Name', 'Histograma de la DataPrueba2');
histogram(DataPrueba2);
 
%%Buscando el valor esperado de las pruebas
ValorEsperado1 = mean(DataPrueba1)
ValorEsperado2 = mean(DataPrueba2)
 
%%Error de clasificacion
%no estoy muy seguro como calcular el mismo
 
 

