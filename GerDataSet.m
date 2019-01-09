close all;

nsamples = 10000;  %��������������

lensample = 1024;

fb=1e6;
fs=64e6;
fc=2e6;
Ns=lensample/(fs/fb);

mods = {'2ASK','2FSK', 'BPSK', '4ASK', '4FSK', 'QPSK', '8ASK', '8FSK', '8PSK', '16QAM', '64QAM' };
snrs = [ -20, -18, -16, -14, -12, -10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10, 12, 14, 16, 18];

chan = rayleighchan(1/fs,100,[0,1e-8],[0,-10]);

modData = zeros([(Ns+1)*fs/fb,2]);
wData = cell(1, nsamples);
for i=1:length(mods)
    mod=mods(i);
    mod=mod{1};
    disp(mod);
    for times = 1:nsamples/length(snrs)
        for j=1:length(snrs)
            snr=snrs(j);
            start=randi([1,fs/fb]);
            start=1;
            modData(:, 1) = generate_signal(mod, snr, Ns+1, fb, fc, fs);
            modData(:, 2) = snr;
            wData{1,(times-1)*length(snrs)+j} = modData(start:(fs/fb*Ns+start-1),:);
        end
    end
    fileName = ['/home/zev/Documents/Workspace/DataSet/Mat_rayleigh/studentnet/TrainData_-20_20/' , mod];
    save(fileName,'wData');
end