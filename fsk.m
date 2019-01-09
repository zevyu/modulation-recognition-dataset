% ���������ź� ���������ݣ��������ʣ��ز�Ƶ�ʣ������ʣ�
function s = fsk(d,fb,fc,fs,M)

s = fskmod(d,M,fc,fs/fb,fs);
% t = (0:length(DataConstel)-1)/fs;
% carrier = exp(1i*(M*pi*t*fc));
% s = real(DataConstel).*real(carrier) - imag(DataConstel).*imag(carrier);

% N=length(d);M=fs/fb;Nc=fs/fc;
% s=zeros(1,M*N);
% for j = 1:N
%     for i = 1:M
%         s((j-1)*M+i)=cos(2*pi*(i-1)/Nc*(d(j)+1));
%     end
% end