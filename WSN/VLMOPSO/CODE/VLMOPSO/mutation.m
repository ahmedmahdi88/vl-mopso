function mutatedParticle= mutation(particle,mutationProbability,mutationRatio)
if rand < mutationProbability
numberOfMutatedVariables=ceil(mutationRatio*length(paticle.x));
randomIndicis=ranperm(1,numberOfMutatedVariables);
particle.x(randomIndicis)= particle.x(randomIndicis)+...
    rand(1,numberOfMutatedVariables)*particle.x(randomIndicis);
particle.y(randomIndicis)= particle.y(randomIndicis)+...
    rand(1,numberOfMutatedVariables)*particle.y(randomIndicis);
else
    return;
end
end