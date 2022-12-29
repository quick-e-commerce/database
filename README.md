# 서버 구동

## 자동으로 구동하기

자동으로 서버를 구동하고 초기설정을 하는 스크립트가 `run.sh` 에 작성되어 있다. 다음의 명령어로 실행이 가능하다.

```shell
$ chmod +x run.sh && ./run.sh
```

## 수동으로 구동하기

도커 컨테이너를 빌드한 후에는 반드시 아래의 커맨드를 실행해야 MySQL 서버가 구동된다.

```shell
$ > service mysql restart

 * Stopping MariaDB database server mysqld    [ OK ]
 * Starting MariaDB database server mysqld    [ OK ]
```

MySQL 서버가 구동되고 있는 상태에서는 아래와 같이 MySQL 서버에 진입할 수 있다.

```shell
$ > mysql

$ MariaDB [(none)]>
```

### 초기 설정

MySQL 서버를 Backend API에서 사용할 수 있도록 하려면, 데이터베이스와 사용자 계정을 만들어야 한다.

#### 데이터베이스 생성

데이터베이스 명을 `mode` 라고 가정할 때, 다음과 같이 데이터베이스를 생성할 수 있다.

```shell
$ MariaDB [(none)]> CREATE DATABASE mode;

Query OK, 1 row affected (0.001 sec)
```

```shell
$ MariaDB [(none)]> USE mode;

Database changed
```

```shell
$ MariaDB [mode]>
```

#### 사용자 생성

사용자의 정보가 다음과 같을 때,

* 사용자: `'test'@'localhost'`
* 비밀번호: `'password'`

해당 사용자는 다음의 커맨드로 생성이 가능하다.

```shell
$ MariaDB [mode]> CREATE USER 'test'@'localhost' identified by 'password';

Query OK, 0 rows affected (0.002 sec)
```

권한 역시 부여해주어야 하는데, 사용하려는 DB가 `mode`이므로 다음의 명령을 통해 권한을 부여해줄 수 있다.

```shell
$ MariaDB [mode]> GRANT ALL PRIVILEGES ON mode.* TO 'test'@'localhost';

Query OK, 0 rows affected (0.002 sec)
```