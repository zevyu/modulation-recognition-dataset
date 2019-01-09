% ���������ź� �����ͣ�����ȣ����Ÿ������������ʣ��ز�Ƶ�ʣ������ʣ�
function signal = generate_signal(type, snr, data_n, SymbolRate, CarrierRate, SampleRate, chan)


type = upper(type); % ��д
if length(type) == 4
    if strcmp(type(1), 'Q')
        n = 4;   
        style = type(2:4);
    elseif strcmp(type(1), 'B')
        n = 2;
        style = type(2:4);
    else
        n = str2double(type(1));
        style = type(2:4);
    end
elseif length(type) == 5
    n = str2double(type(1:2));
    style = type(3:5);
elseif length(type) == 6
    n = str2double(type(1:3));
    style = type(4:6);
else
    error('error input in generate_signal');
    return;
end

BitPerSymbol = log2(n); % ��Ԫλ

M = 2^BitPerSymbol;% ������
DataSymbol = randi([0 M-1],1,data_n);% 1*10000��0-M-1�������ÿһ�������������������������ʱ��Ϊ���ݵ����Ϊ10000��

switch style
    case {'ASK'}
        DataConstel = ask(DataSymbol,SymbolRate,CarrierRate,SampleRate,M);
    case {'FSK'}
        DataConstel = fsk(DataSymbol,SymbolRate,CarrierRate,SampleRate,M);
    case {'PSK'}
        DataConstel = psk(DataSymbol,SymbolRate,CarrierRate,SampleRate,M);
    case {'QAM'}
        DataConstel = qam(DataSymbol,SymbolRate,CarrierRate,SampleRate,M);
end

if nargin == 7
    DataConstel = filter(chan,DataConstel);
end


t = (0:length(DataConstel)-1)*CarrierRate/SampleRate;
if strcmp(style,'FSK')
    carrier = exp(1i*(M*pi*t));
else
    carrier = exp(1i*(2*pi*t));
end
signal = real(DataConstel).*real(carrier)+imag(DataConstel).*imag(carrier);

signal = awgn(signal,snr,'measured');
signal=signal/sqrt(mean(abs(signal).^2));



