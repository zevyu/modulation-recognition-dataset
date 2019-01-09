% ���������ź� ���������ݣ��������ʣ��ز�Ƶ�ʣ����ƽ�����
function s = psk(d,fb,fc,fs,M)

% N=length(d);M=fs/fb;Nc=fs/fc;
% s=zeros(1,M*N);
% for j = 1:N
%    for i = 1:M
%      s((j-1)*M+i)=cos(2*pi*(i-1+(j-1)*M)/Nc+d(j)*pi*2/t);
%    end
% end
if M==2
    DataConstel = pskmod(d, M, pi/4, 'Gray'); % ������
else
    DataConstel = pskmod(d, M, pi/M, 'Gray');
end

% DataConstel = modulate(h,d); % ����
N = length(DataConstel);
K = fs/fb;
s=zeros(1,N*K);

for i=1:K
    s(i:K:end)=DataConstel;
end

% t = (0:N*K-1)/fs;
% carrier = exp(1i*(2*pi*t*fc));
% s = iDataBase.*real(carrier)+qDataBase.*imag(carrier);
