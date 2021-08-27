abstract class Mapper<Source, Domain>{

  Domain mapToDomain(Source source);

  Source mapFromDomain(Domain domain);

}