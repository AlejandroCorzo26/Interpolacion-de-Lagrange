clc; clear; close all; % Limpiar

% Función que implementa la interpolación de Lagrange
function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)
    n = length(x_points) - 1;   % Resto 1 porque los índices van desde 0 hasta n
    y_interp = 0;               % Inicializo la suma del polinomio
    for i = 0:n
        L = 1; % Inicializo el producto
        
        % Construyo el polinomio base L_i(x)
        for j = 0:n
            if j ~= i
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
            end
        end
        
        % Sumo el término correspondiente al resultado
        y_interp = y_interp + y_points(i+1) * L;
    end
    
    % Calculo el error relativo porcentual
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Ejemplo 1: puntos más separados
x_points = [1, 4, 6]; % Valores conocidos de x
y_points = [0, 1.386294, 1.791759]; % ln(x) evaluado en los puntos anteriores
[y1, error1] = lagrange_interp(x_points, y_points, 2, 0.6931472); 
fprintf('Ejemplo 1: ln(2) ≈ %.4f, Error = %.1f%%\n', y1, error1); % Imprimir

% Ejemplo 2: puntos más cercanos
x_points = [1, 2, 3]; % Puntos más próximos a 2
y_points = [0, 0.6931472, 1.098612]; % ln(x) en esos puntos
[y2, error2] = lagrange_interp(x_points, y_points, 2, 0.6931472);
fprintf('Ejemplo 2: ln(2) ≈ %.4f, Error = %.1f%%\n', y2, error2); % Imprimir
