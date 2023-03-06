%The code asks the user to specify what order of matrix and how many of
%them they want. It then generates that number of square matrices randomly.
%It then calculates the value of a specific number N, based on the order of
%the matrix(n). It then finds ou how many magic and semi magic arrays are
%generated in them It also finds the value of magic rows and magic columns
%wihtin them .
%
n = input('Enter the order of the matrix: ');
while n <= 2
    n = input('Error , n must be a whole number greater than 2. Enter the correct order of the matrix again: ');
end

M = input('Enter the number of arrays to be generated: ');
while M <= 0 
    M = input('M must be a non-zero whole number. Re-enter the correct value of M ');
end

is_magic = 0;
semi_magic = 0;
magic_rows = 0;
magic_cols = 0;

for k = 1:M
    P = randperm(n^2);
    X = reshape(P,[n,n]);

    N = n*(n^2+1)/2;
    rows_count = 0;
    cols_count = 0;
    count_diags = 0;
    sum_of_first_diagonal = 0;
    sum_of_second_diagonal = 0;
    
    for i = 1:n
        
        if sum(X(i,:)) == N
            rows_count = rows_count + 1;
        end
        
        if sum(X(:,i)) == N
            cols_count = cols_count + 1;
        end
        
        
        sum_of_first_diagonal = sum_of_first_diagonal + X(i,i);
        sum_of_second_diagonal = sum_of_second_diagonal + X(i,n-i+1);
    end
    
    if sum_of_first_diagonal == N && sum_of_second_diagonal == N
        count_diags = 1;
    end

    if rows_count == n
        if cols_count == n
            if count_diags == 1
                is_magic = is_magic + 1;
            else
                semi_magic = semi_magic + 1;
            end
        else
            magic_rows = magic_rows + 1;
        end

    elseif cols_count == n
        magic_cols = magic_cols + 1;
    end
    
end

fprintf('The number of magic arrays is:%d \n', magic);
fprintf('The number of semimagic arrays is:%d \n', semi_magic);
fprintf('The number of magic columns is:%d \n', magic_cols);
fprintf('The number of magic rows is:%d \n', magic_rows);