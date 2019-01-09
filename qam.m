% ���������ź� ���������ݣ��������ʣ��ز�Ƶ�ʣ�������,���ƽ�����
function s = qam(d,fb,fc,fs,M)
                
DataConstel = qammod(d, M, 'Gray'); % ������
%DataConstel = modulate(h,d); % ����
N = length(DataConstel);
K = fs/fb;
s=zeros(1,N*K);
for i=1:K
    s(i:K:end)=DataConstel;
end

% t = (0:N*K-1)/fs;
% carrier = exp(1i*(2*pi*t*fc));
% s = real(DataConstel_up).*real(carrier)+imag(DataConstel_up).*imag(carrier);