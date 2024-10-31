function coded_message = amp_coding_1(message, coding_rate, mapset)
    message_len = length(message);
    message_bin = cell(1, message_len);
    Nch = 32;
    for i = 1:message_len
        ch = message(i);
        for j = 1:Nch
            if ch == mapset{1, j}
                message_bin{i} = mapset{2, j};
            end
        end
    end

    % Concatenate the binary strings and convert to numeric array
    digitsNumeric = bin2dec([message_bin{:}]);

    % Reshape the numeric array
    digitsArray = reshape(digitsNumeric, coding_rate, []);

    % Transpose the array
    digitsArray = digitsArray';

    % Initialize coded_message
    coded_message = zeros(size(digitsArray));

    % Define t
    t = linspace(0, 1, coding_rate);

    % Perform amplitude coding
    for m = 1:size(digitsArray, 1)
        for n = 1:size(digitsArray, 2)
            % Amplitude modulation
            coded_message(m, n) = sin(2 * pi * t) * digitsArray(m, n);
        end
    end
end
