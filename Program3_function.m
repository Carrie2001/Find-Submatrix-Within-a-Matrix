%Program3_function.m
%
%Author: Michael Moloney
%Account: mmoloney1
%CSC 4630 Program #3
%
%Due Date: Oct.25, 2018
%
%Description:
%This function searches for a submatrix within a larger matrix. The
%function will find multiple instances if they exist, and it will work for
%any matlab variable type.
%
%Input:
%The function takes two matrices as input. The matrices may contain an
%matlab variable type(double,char,logical,etc.)
%
%Output:
%The program will output the number of instances that the submatrix exists
%within the matrix, as well as the row and column coordinates of the upper
%left element of the submatrix. If the submatrix doesn't exist, is larger
%than the matrix, or the matrices contain different variable types the
%program will output notifications and exit.
%
%Usage:
%input - matrix[1 2 3;1 2 3;4 5 6], submatrix[2 3;5 6]
%output - count = 1, rows = 2, columns = 2
%

function [count,rows,columns] = subMatFunc(mat,subMat)
%if/else statement 1: verifies that inputs are actually matrices and that they
%are both of the same variable type. If true:continue If false: notify user
%and exit
if (ismatrix(mat) && ismatrix(subMat) && size(class(mat),2)==size(class(subMat),2))
    %size of matrix and submatrix are collected as variables
    [rowM,colM] = size(mat);
    [rowSM,colSM] = size(subMat);
    %if/else statement 2: Verifies that submatrix is indeed smaller than matrix
    %if true: continue, if false: notify user and exit
    if(rowM>=rowSM && colM>=colSM)
        %Main algorithm of function:
        %if/elif statement checks if variable type is non numerical, if so, converts
        %it to numerical so that it will work with matrix convolution(conv2)
        if islogical(mat)
            mat = double(mat);
            subMat = double(subMat);
        elseif ischar(mat)
            mat = uint8(mat);
            subMat = uint8(subMat);
        end
        %apply matrix convolution to the two matrices, and save this as a variable
        conMax = conv2(mat,subMat,'valid');
        %Convolute the submatrix to itself to obtain the number we are trying
        %to find inside the conMax matrix created in the previous step. Save this
        %to a variable
        numToLookFor = conv2(subMat,subMat,'valid');
        %Use find to save the upper left row and column coordinates of all matches
        %in the conMax matrix to variables i(rows) and j(columns)
        [i,j] = find(conMax==numToLookFor);
            
            %Matrix convolution(conv2) can give false positives. These nested for loops
            %check which positives actually equal the submatrix and store their row and
            %column coordinates to the arrays y and z.
            
            y = [];
            z = [];
            
            for n = 1:length(i)
                row=i(n,1);
                col=j(n,1);
                same=1;
                for u=1:rowSM
                    for v=1:colSM
                        if subMat(u,v) ~= mat(u+(row-1),v+(col-1))
                            same=0;
                        end
                    end
                end
                if same==1
                    y =[y row];
                    z =[z col];
                end
            end
            
            %If the size of y is 0, then no matches were found. Output this information
            %to the user and quit.
            if size(y,2)==0 || size(y,1)==0
                disp('The submatrix does not exist in the matrix.');
                count = 0;
                rows = 'null';
                columns = 'null';
                return;
                
                %The final count and coordinates are saved to the output variables of the
                %function
            else
                count = length(y);
                rows = y;
                columns = z;
            end
            %If/else statement 2: ending else condition
        else
            disp('The submatrix is not smaller than the matrix. Try switching parameters.');
            count = 0;
            rows = 'null';
            columns = 'null';
            return;
        end
        %If/else statement 1: ending else condition
    else
        disp('Either one or more of the inputs is not a 2D matrix, or their class types do not match.');
        count = 0;
        rows = 'null';
        columns = 'null';
        return;
    end
end