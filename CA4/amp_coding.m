function coded_message = amp_coding (message, coding_rate, mapset)

message_len=length(message);
message_bin=cell(1,message_len);
Nch = 32;
for i=1:message_len
    ch=message(i);
    for j=1:Nch
        if ch==mapset{1,j}
            message_bin{i}=mapset{2,j};
        end
    end
end

digitsNumeric = str2num(message_bin');
digitsArray = reshape(digitsNumeric, coding_rate, []);
digitsArray = digitsArray';

coded_message = length(digitsArray)
for m=1:lenght(digitsArray)
    coded_message{i} = (1/2^coding_rate-1) * sin(2*pi*t)* bin2dec(digitsArray{i});
end


end