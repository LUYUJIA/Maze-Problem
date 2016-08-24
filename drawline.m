plot([1:20:200],step_data1(1,1:20:200),'linewidth',3);
hold on
plot([1:20:200],step_data(1,1:20:200),'linewidth',3);
h1=xlabel('Times');
h2=ylabel('Steps');
h3=legend('greedy TD(0)','greedy Q-learning')
set(h1,'FontSize',16);
set(h2,'FontSize',16);
set(h3,'FontSize',16);