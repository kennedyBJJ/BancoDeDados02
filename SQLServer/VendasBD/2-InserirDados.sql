use VendasBD

--- produtos---
INSERT into produtos    VALUES  ('lapis' , 100, 0.8 , 1)
INSERT into produtos    VALUES  ('apontador', 100, 2.5 , 1)
INSERT into produtos    VALUES  ('caneta' , 100, 1.2 , 1)
INSERT into produtos    VALUES  ('caderno' , 100,4.5 , 1)
INSERT into produtos    VALUES  ('borracha' , 100, 0.9 , 1)

--- Pessoas---
INSERT into pessoas (nome, cpf, status) VALUES ('Batman', '33333333333', 1)
INSERT into pessoas VALUES  ('Superman', '11111111111', 1)
INSERT into pessoas VALUES  ('Spiderman', '22222222222', 1)
INSERT into pessoas VALUES  ('Wonder Woman', '44444444444', 1)
INSERT into pessoas VALUES  ('Iron Man', '55555555555', 1)
INSERT into pessoas VALUES  ('Super girl', '66666666666', 1)
INSERT into pessoas VALUES  ('Thor', '77777777777', 1)
INSERT into pessoas VALUES  ('Aquaman', '888888888888', 1)
INSERT into pessoas VALUES  ('Flash', '999999999999', 1)


--- Clientes---
INSERT into clientes values (1, 10000, 3000)
INSERT into clientes values (2, 15000, 5000)
INSERT into clientes values (9, 5000, 2000)

--- Funcionarios---
INSERT into funcionarios VALUES (4, 2500, null)
INSERT into funcionarios VALUES (6, 1000, 4)
INSERT into funcionarios VALUES (7, 4500, null)
INSERT into funcionarios VALUES (8, 1500, 7)

--- Estagiarios ---
INSERT into estagiarios VALUES (3, 800)
INSERT into estagiarios VALUES (5, 800)

--- Pedidos ---
INSERT into pedidos VALUES (GETDATE(), null,1,1,6,3)
INSERT into pedidos VALUES (GETDATE(), null,1,2,8,5)
INSERT into pedidos VALUES (GETDATE(), null,1,1,6,5)
INSERT into pedidos VALUES (GETDATE(), null,1,1,8,3)
INSERT into pedidos VALUES (GETDATE(), null,1,2,6,5)
INSERT into pedidos VALUES (GETDATE(), null,1,2,8,3)


--- Pedido 1 ---
INSERT into itensPedido VALUES (1,1, 10, 0.8)
INSERT into itensPedido VALUES (1,2, 10, 2.5)
INSERT into itensPedido VALUES (1,3, 10, 1.2)
INSERT into itensPedido VALUES (1,4, 10, 4.5)
INSERT into itensPedido VALUES (1,5, 10, 0.9)--

--- Pedido 2 ---
INSERT into itensPedido VALUES (2,1, 5, 0.9)
INSERT into itensPedido VALUES (2,2, 5, 2.5)
INSERT into itensPedido VALUES (2,3, 5, 1.2)
INSERT into itensPedido VALUES (2,4, 5, 4.5)

--- Pedido 3 ---
INSERT into itensPedido VALUES (3,2, 3, 2.5)
INSERT into itensPedido VALUES (3,3, 3, 1.2)
INSERT into itensPedido VALUES (3,4, 3, 4.5)

--- Pedido 4 ---
INSERT into itensPedido VALUES (4,3, 2, 1.2)
INSERT into itensPedido VALUES (4,5, 2, 0.9)

--- Pedido 5 ---
INSERT into itensPedido VALUES (5,5, 1, 0.9)
GO

