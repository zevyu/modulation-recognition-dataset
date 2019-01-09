% ���������ź� ���������ݣ��������ʣ��ز�Ƶ�ʣ������ʣ�
function s = ask(d,fb,fc,fs,M)

s = zeros([1,length(d)*fs/fb]);
for i=1:fs/fb
    s(i:fs/fb:end)=d;
end





% N=length(d);M=fs/fb;Nc=fs/fc;
% s=zeros(1,M*N);
% for j = 1:N
% 	for i = 1:M
% 		s((j-1)*M+i)=sin(2*pi*(i-1)/Nc)*d(j);
%     end
% end
